package com.example.demo.hiveconfig;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;


@Configuration
public class config1 {
    @Value("${hive1.url}")
    private String url;

    @Value("${hive1.driver-class-name}")
    private String driver;

    @Value("${hive1.user}")
    private String user;

    @Value("${hive1.password}")
    private String password;


    @Bean
    public DataSource dataSource1(){
        DataSource dataSource1 = new DataSource();
        dataSource1.setUrl(url);
        dataSource1.setDriverClassName(driver);
        dataSource1.setUsername(user);
        dataSource1.setPassword(password);
        return dataSource1;
    }

    @Bean
    public JdbcTemplate jdbcTemplate1(DataSource dataSource1){
        return new JdbcTemplate(dataSource1);
    }
}

