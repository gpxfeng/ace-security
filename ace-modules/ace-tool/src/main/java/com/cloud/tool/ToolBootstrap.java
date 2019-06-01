package com.cloud.tool;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;


@SpringBootApplication
@EnableEurekaClient
public class ToolBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(ToolBootstrap.class).web(true).run(args);
//        SpringApplication.run(ToolBootstrap.class,args);
    }

}
