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

package com.us.openserver.protocols.winauth;

import com.us.openserver.Level;
import com.us.openserver.protocols.AuthenticationProtocolBase;

public class WinAuthProtocol extends AuthenticationProtocolBase
{
    public static final int PROTOCOL_IDENTIFIER = 0x0002;
    
    protected WinAuthProtocol()
    {
    }
    
    protected void log(Level level, String message)
    {
        session.log(level, String.format("[WinAuth] %s", message));
    }
}
