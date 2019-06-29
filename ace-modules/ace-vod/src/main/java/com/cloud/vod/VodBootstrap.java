package com.cloud.vod;

import com.cloud.auth.client.EnableAceAuthClient;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@MapperScan("com.cloud.vod.mapper")
@EnableFeignClients({"com.cloud.auth.client.feign"})
@EnableAceAuthClient
@EnableEurekaClient
public class VodBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(VodBootstrap.class, args);
    }
}
