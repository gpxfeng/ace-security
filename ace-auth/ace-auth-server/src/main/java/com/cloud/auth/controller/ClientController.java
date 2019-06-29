package com.cloud.auth.controller;

import com.cloud.auth.configuration.KeyConfiguration;
import com.cloud.auth.service.AuthClientService;
import com.cloud.common.msg.ObjectRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("client")
public class ClientController{
    @Autowired
    private AuthClientService authClientService;
    @Autowired
    private KeyConfiguration keyConfiguration;

    /**
     * 提供服务服务id和服务秘钥获取token
     * @param clientId
     * @param secret
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/token", method = RequestMethod.POST)
    public ObjectRestResponse getAccessToken(String clientId, String secret) throws Exception {
        return new ObjectRestResponse<String>().data(authClientService.apply(clientId, secret));
    }

    /**
     * 从数据库中比对获取连接
     * @param serviceId
     * @param secret
     * @return
     */
    @RequestMapping(value = "/myClient")
    public ObjectRestResponse getAllowedClient(String serviceId, String secret) {
        return new ObjectRestResponse<List<String>>().data(authClientService.getAllowedClient(serviceId, secret));
    }

    @RequestMapping(value = "/servicePubKey",method = RequestMethod.POST)
    public ObjectRestResponse<byte[]> getServicePublicKey(@RequestParam("clientId") String clientId, @RequestParam("secret") String secret) throws Exception {
        authClientService.validate(clientId, secret);
        return new ObjectRestResponse<byte[]>().data(keyConfiguration.getServicePubKey());
    }

    /**
     * 从redis中获取userPubKey
     * @param clientId
     * @param secret
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/userPubKey",method = RequestMethod.POST)
    public ObjectRestResponse<byte[]> getUserPublicKey(@RequestParam("clientId") String clientId, @RequestParam("secret") String secret) throws Exception {
        authClientService.validate(clientId, secret);
        return new ObjectRestResponse<byte[]>().data(keyConfiguration.getUserPubKey());
    }


}
