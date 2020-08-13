package com.czxy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * Created by 兰锦扬 on 2020/8/7.
 */

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class MySpringBootStarter {
    public static void main(String[] args) {
        SpringApplication.run(MySpringBootStarter.class,args);
    }
}
