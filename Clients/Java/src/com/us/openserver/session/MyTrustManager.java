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

package com.us.openserver.session;

import java.security.*;
import java.security.cert.*;
import javax.net.ssl.*;

public class MyTrustManager implements X509TrustManager {

    private X509TrustManager standardTrustManager = null;

    public MyTrustManager(KeyStore keystore)
        throws NoSuchAlgorithmException, KeyStoreException
    {
        super();
        TrustManagerFactory factory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        factory.init(keystore);
        TrustManager[] trustManagers = factory.getTrustManagers();
        if (trustManagers.length == 0)
            throw new NoSuchAlgorithmException("Default trust manager algorithm not found.");

        this.standardTrustManager = (X509TrustManager) trustManagers[0];
    }

    public void checkClientTrusted(X509Certificate[] certificates, String authType)
        throws CertificateException
    {
        standardTrustManager.checkClientTrusted(certificates, authType);
    }

    public void checkServerTrusted(X509Certificate[] certificates, String authType)
        throws CertificateException
    {
        if ((certificates != null) && (certificates.length == 1))
            certificates[0].checkValidity();
        else
            standardTrustManager.checkServerTrusted(certificates, authType);
    }

    public X509Certificate[] getAcceptedIssuers()
    {
        return this.standardTrustManager.getAcceptedIssuers();
    }
}
