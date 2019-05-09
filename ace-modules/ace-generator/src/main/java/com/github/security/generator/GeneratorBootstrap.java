package com.github.security.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * @author Mr.D
 * @email 792513147@qq.com
 * @date 2019年05月08日
 */
@SpringBootApplication
@MapperScan("com.github.security.generator.mapper")
@EnableEurekaClient
public class GeneratorBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(GeneratorBootstrap.class, args);
    }
}
