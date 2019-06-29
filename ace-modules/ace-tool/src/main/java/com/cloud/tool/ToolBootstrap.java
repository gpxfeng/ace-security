package com.cloud.tool;


import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@EnableEurekaClient
@ComponentScan(value = {"com.cloud.tool.elasticsearch"})
public class ToolBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(ToolBootstrap.class).web(true).run(args);
    }

}
