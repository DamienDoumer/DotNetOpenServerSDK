/*
Copyright 2015-2016 Upper Setting Corporation

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
using System.IO;
using System.Threading;

namespace US.OpenServer.Protocols
{
    /// <summary>
    /// Abstract base class that is the basis of all protocol layer implementations.
    /// </summary>
    public abstract class ProtocolBase : IDisposable
    {
        /// <summary>
        /// Gets the connection session.
        /// </summary>
        protected SessionBase Session { get; private set; }

        /// <summary>
        /// Creates a ProtocolBase object.
        /// </summary>
        protected ProtocolBase()
        {
        }

        /// <summary>
        /// Initializes the class.
        /// </summary>
        /// <param name="session">A SessionBase that encapsulates the connection
        /// session.</param>
        ///<param name="pc">A ProtocolConfiguration that contains configuration
        ///properties.</param>
        /// <param name="userData">An object that may be used client applications to pass
        /// objects or data to client side protocol implementations.</param>
        public virtual void Initialize(SessionBase session, ProtocolConfiguration pc = null, object userData = null)
        {
            this.Session = session;
        }

        /// <summary>
        /// Closes the protocol layer allowing for command packet transmission (e.g. a
        /// Keep-Alive.QUIT command packet) then releases associated resources.
        /// </summary>
        public virtual void Close()
        {
        }

        /// <summary>
        /// Immediately closes the protocol layer then releases associated resources.
        /// </summary>
        public virtual void Dispose()
        {
        }

        /// <summary>
        /// Handles received command packets.
        /// </summary>
        /// <param name="br">A BinaryReader that contains the command packet.</param>
        public virtual void OnPacketReceived(BinaryReader br)
        {
        }

        /// <summary>
        /// Handles remote protocol configuration errors.
        /// </summary>
        /// <remarks>
        /// Locks this object, logs an <see cref="US.OpenServer.Level.Error"/> message
        /// to the <see cref="US.OpenServer.Logger"/> then calls Monitor.PulseAll(this)
        /// to release any locks the derived class may currently have waiting for a
        /// command response. If the lock is undesirable, override this function.
        /// </remarks>
        /// <param name="message">A String that contains the error message.</param>
        public virtual void OnErrorReceived(string message)
        {
            lock (this)
            {
                Log(Level.Error, message);
                Monitor.PulseAll(this);
            }
        }

        /// <summary>
        /// Log's a message.
        /// </summary>
        /// <param name="level">A Level that specifies the priority of the message.</param>
        /// <param name="message">A string that contains the message.</param>
        protected virtual void Log(Level level, string message)
        {
            Session.Log(level, string.Format("[ProtocolBase] {0}", message));
        }
    }
}