/*
Copyright 2015 Upper Setting Corporation

This file is part of DotNetOpenServer SDK.

DotNetOpenServer SDK is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

DotNetOpenServer SDK is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
DotNetOpenServer SDK. If not, see <http://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Diagnostics;
using US.OpenServer;
using US.OpenServer.Configuration;
using US.OpenServer.Protocols;
using Windows.Foundation;
using Windows.Networking;
using Windows.Networking.Sockets;
using Windows.Security.Cryptography.Certificates;

namespace US.OpenServer.WindowsMobile
{
    /// <summary>
    /// Class that connects to the server and optionally enables SSL/TLS 1.2.
    /// </summary>
    public class Client
    {
        #region Events
        /// <summary>
        /// Delegate that defines the event callback for the <see cref="OnConnectionLost"/> event.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="ex">An Exception that contains the reason the connection was lost.</param>
        public delegate void OnConnectionLostHandler(object sender, Exception ex);

        /// <summary>
        /// Event that is triggered when the connection to the server is lost.
        /// </summary>
        public event OnConnectionLostHandler OnConnectionLost;
        #endregion

        #region Properties
        /// <summary>
        /// Gets the application logger.
        /// </summary>
        public Logger Logger { get; private set; }

        /// <summary>
        /// Gets a Dictionary of <see cref="ProtocolConfiguration"/> objects keyed by
        /// each protocol's unique identifier.
        /// </summary>
        public Dictionary<ushort, ProtocolConfiguration> ProtocolConfigurations { get; private set; }

        /// <summary>
        /// Gets the server configuration.
        /// </summary>
        public ServerConfiguration ServerConfiguration { get; private set; }

        /// <summary>
        /// Gets the optional user defined Object that is passed through to each <see cref="ProtocolBase"/>
        /// object.
        /// </summary>
        public object UserData { get; private set; }
        #endregion

        #region Variables
        /// <summary>
        /// Implements the connection session.
        /// </summary>
        private Session session;

        /// <summary>
        /// The connection socket.
        /// </summary>
        private StreamSocket streamSocket;
        #endregion

        #region Constructor
        /// <summary> Creates an instance of Client. </summary>        
        /// <param name="serverConfiguration">Contains the properties necessary to
        /// connect to the server.</param>
        /// <param name="protocolConfigurations">A Dictionary of ProtocolConfiguration
        /// objects keyed with each protocol's unique identifier.</param>
        /// <param name="logger">An optional Logger to log messages. If null is passed,
        /// a <see cref="US.OpenServer.Logger"/> object is created.</param>      
        /// <param name="userData">An optional Object the caller can pass through to
        /// each protocol.</param>
        public Client(
            ServerConfiguration serverConfiguration,
            Dictionary<ushort, ProtocolConfiguration> protocolConfigurations,
            Logger logger = null,
            object userData = null)
        {
            if (logger == null)
                logger = new Logger();
            Logger = logger;
            Logger.Log(Level.Info, string.Format("Execution Mode: {0}", Debugger.IsAttached ? "Debug" : "Release"));

            ServerConfiguration = serverConfiguration;
            ProtocolConfigurations = protocolConfigurations;
            UserData = userData;
        }
        #endregion

        #region Public Functions
        /// <summary>
        /// Connects to the server, creates a Session, optionally enables SSL/TLS 1.2
        /// and begins an asynchronous socket read operation.
        /// </summary>
        public void Connect()
        {
            Close();

            streamSocket = new StreamSocket();
            streamSocket.Control.NoDelay = true;
            HostName hostName = new HostName(ServerConfiguration.Host);

            if (ServerConfiguration.TlsConfiguration != null && ServerConfiguration.TlsConfiguration.Enabled)
            {
                try
                {
                    IAsyncAction aa = streamSocket.ConnectAsync(hostName, ServerConfiguration.Port.ToString(), SocketProtectionLevel.Tls12);
                    aa.AsTask().Wait();
                }
                catch (Exception ex)
                {
                    if (streamSocket.Information.ServerCertificateErrorSeverity != SocketSslErrorSeverity.Ignorable)
                        throw ex.InnerException != null ? ex.InnerException : ex;

                    foreach (ChainValidationResult error in streamSocket.Information.ServerCertificateErrors)
                    {
                        switch (error)
                        {
                            case ChainValidationResult.IncompleteChain:
                                if (ServerConfiguration.TlsConfiguration.AllowCertificateChainErrors)
                                    streamSocket.Control.IgnorableServerCertificateErrors.Add(error);
                                break;
                            case ChainValidationResult.Untrusted:
                                if (ServerConfiguration.TlsConfiguration.AllowSelfSignedCertificate)
                                    streamSocket.Control.IgnorableServerCertificateErrors.Add(error);
                                break;
                            case ChainValidationResult.Revoked:
                                if (ServerConfiguration.TlsConfiguration.CheckCertificateRevocation)
                                    streamSocket.Control.IgnorableServerCertificateErrors.Add(error);
                                break;
                            default:
                                throw ex.InnerException != null ? ex.InnerException : ex;
                        }
                    }

                    IAsyncAction aa = streamSocket.ConnectAsync(hostName, ServerConfiguration.Port.ToString(), SocketProtectionLevel.Tls12);
                    try
                    {
                        aa.AsTask().Wait();
                    }
                    catch (Exception ex2)
                    {
                        throw ex2.InnerException != null ? ex2.InnerException : ex2;
                    }
                }
            }
            else
            {
                IAsyncAction aa = streamSocket.ConnectAsync(hostName, ServerConfiguration.Port.ToString());
                try
                {
                    aa.AsTask().Wait();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException != null ? ex.InnerException : ex;
                }
            }

            session = new Session(streamSocket, hostName.DisplayName, ServerConfiguration.TlsConfiguration, ProtocolConfigurations, Logger, UserData);
            session.OnConnectionLost += session_OnConnectionLost;
            session.Log(Level.Info, string.Format("Connected to {0}:{1}...", ServerConfiguration.Host, ServerConfiguration.Port));
            session.BeginRead();
        }

        /// <summary>
        /// Gets a list of protocols the server supports.
        /// </summary>
        /// <returns>A UInt16 array of unique protocol IDs.</returns>
        public ushort[] GetServerSupportedProtocolIds()
        {
            if (session == null)
                return new ushort[0];

            return session.GetRemoteSupportedProtocolIds();
        }

        /// <summary>
        /// A function that wraps the <see cref="US.OpenServer.SessionBase.Initialize(ushort, object = null)"/>
        /// function which creates then initializes the protocol.
        /// </summary>
        /// <param name="protocolId">A UInt16 that specifies the unique protocol
        /// identifier.</param>
        /// <returns>A ProtocolBase that implements the protocol.</returns>
        public ProtocolBase Initialize(ushort protocolId)
        {
            return session != null ? session.Initialize(protocolId, UserData) : null;
        }

        /// <summary>
        /// Closes the <see cref="Session"/>.
        /// </summary>
        public void Close()
        {
            if (session != null)
            {
                session.Close();
                session = null;
            }
        }

        /// <summary>
        /// Closes the protocol.
        /// </summary>
        /// <param name="protocolId">A UInt16 that specifies the unique protocol
        /// identifier.</param>
        public void Close(ushort protocolId)
        {
            if (session != null)
            {
                session.Close(protocolId);
            }
        }
        #endregion

        #region Private Functions
        /// <summary>
        /// Event handler for <see cref="SessionBase.OnConnectionLost"/> events.
        /// </summary>
        /// <remarks> When a connection is lost, the Exception is forwarded to objects
        /// that have subscribed to <see cref="OnConnectionLost"/> events.</remarks>
        /// <param name="sender">An object that contains state information for this validation.</param>
        /// <param name="ex">An Exception that contains the error the connection was lost.</param>
        private void session_OnConnectionLost(object sender, Exception ex)
        {
            if (OnConnectionLost != null)
                OnConnectionLost(this, ex);
        }
        #endregion
    }
}
