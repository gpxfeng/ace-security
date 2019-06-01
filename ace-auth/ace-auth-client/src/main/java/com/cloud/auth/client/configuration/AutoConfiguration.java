package com.cloud.auth.client.configuration;

import com.cloud.auth.client.config.ServiceAuthConfig;
import com.cloud.auth.client.config.UserAuthConfig;
import org.springframework.cloud.bus.jackson.RemoteApplicationEventScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan({"com.cloud.auth.client","com.cloud.auth.common.event"})
@RemoteApplicationEventScan(basePackages = "com.cloud.auth.common.event")
public class AutoConfiguration {
    @Bean
    ServiceAuthConfig getServiceAuthConfig(){
        return new ServiceAuthConfig();
    }

    @Bean
    UserAuthConfig getUserAuthConfig(){
        return new UserAuthConfig();
    }

}
