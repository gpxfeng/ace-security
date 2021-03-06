package com.cloud.auth.bean;


import com.cloud.auth.common.util.jwt.IJWTInfo;


public class ClientInfo implements IJWTInfo {
    String id;
    String clientId;
    String name;

    public ClientInfo(String clientId, String name, String id) {
        this.clientId = clientId;
        this.name = name;
        this.id = id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getUniqueName() {
        return clientId;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public String getName() {
        return name;
    }
}
