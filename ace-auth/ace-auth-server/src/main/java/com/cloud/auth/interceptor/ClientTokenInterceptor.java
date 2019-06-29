package com.cloud.auth.interceptor;

import com.cloud.auth.configuration.ClientConfiguration;
import com.cloud.auth.service.AuthClientService;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Autowired;


public class ClientTokenInterceptor implements RequestInterceptor {
    @Autowired
    private ClientConfiguration clientConfiguration;
    @Autowired
    private AuthClientService authClientService;

    @Override
    public void apply(RequestTemplate requestTemplate) {
        try {
            requestTemplate.header(clientConfiguration.getClientTokenHeader(), authClientService.apply(clientConfiguration.getClientId(), clientConfiguration.getClientSecret()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
