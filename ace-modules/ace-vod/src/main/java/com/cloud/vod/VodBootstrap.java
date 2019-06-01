package com.cloud.vod;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@MapperScan("com.cloud.vod.mapper")
@EnableEurekaClient
public class VodBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(VodBootstrap.class, args);
    }
}
