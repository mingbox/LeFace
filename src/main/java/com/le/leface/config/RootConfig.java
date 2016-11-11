package com.le.leface.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//was intended to define shared resources visible to all other web components, servlets etc and for cross-cutting concerns like security
@Configuration
@ComponentScan(basePackages = { "com.le.leface.dao", "com.le.leface.service" })
public class RootConfig {

}
