package com.cloud.trace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import zipkin.server.EnableZipkinServer;


@SpringBootApplication
@EnableZipkinServer
public class TraceBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(TraceBootstrap.class,args);
    }
}
