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
using US.OpenServer;
using US.OpenServer.Configuration;
using US.OpenServer.Protocols;
using US.OpenServer.Protocols.Hello;
using US.OpenServer.Protocols.KeepAlive;
using US.OpenServer.Protocols.WinAuth;

namespace HelloClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Client client = null;
            try
            {
                ServerConfiguration cfg = new ServerConfiguration();
                //cfg.Host = "yourserver.com";
                //cfg.TlsConfiguration.Enabled = true;

                Dictionary<ushort, ProtocolConfiguration> protocolConfigurations =
                    new Dictionary<ushort, ProtocolConfiguration>();

                protocolConfigurations.Add(KeepAliveProtocol.PROTOCOL_IDENTIFIER,
                    new ProtocolConfiguration(KeepAliveProtocol.PROTOCOL_IDENTIFIER, typeof(KeepAliveProtocol)));

                protocolConfigurations.Add(WinAuthProtocol.PROTOCOL_IDENTIFIER,
                    new ProtocolConfiguration(WinAuthProtocol.PROTOCOL_IDENTIFIER, typeof(WinAuthProtocolClient)));

                protocolConfigurations.Add(HelloProtocol.PROTOCOL_IDENTIFIER,
                    new ProtocolConfiguration(HelloProtocol.PROTOCOL_IDENTIFIER, typeof(HelloProtocolClient)));

                client = new Client(cfg, protocolConfigurations);
                client.Connect();

                ushort[] protocolIds = client.GetServerSupportedProtocolIds();
                foreach (int protocolId in protocolIds)
                    Console.WriteLine("Server Supports Protocol ID: " + protocolId);

                string userName = "TestUser";
                WinAuthProtocolClient wap = client.Initialize(WinAuthProtocol.PROTOCOL_IDENTIFIER) as WinAuthProtocolClient;
                if (!wap.Authenticate(userName, "T3stus3r", null))
                    throw new Exception("Access denied.");

                client.Initialize(KeepAliveProtocol.PROTOCOL_IDENTIFIER);

                HelloProtocolClient hpc = (HelloProtocolClient)client.Initialize(HelloProtocol.PROTOCOL_IDENTIFIER);
                string serverResponse = hpc.Hello(userName);
                Console.WriteLine(serverResponse);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Console.ReadKey();
                if (client != null)
                    client.Close();
            }
        }
    }
}