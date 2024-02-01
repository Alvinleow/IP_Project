package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;

@Repository
public class DatabaseInitializer {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void initialize() {
        String sql = "CREATE TABLE IF NOT EXISTS `user` (" +
                     "`id` int(11) NOT NULL AUTO_INCREMENT," +
                     "`fullname` varchar(50) DEFAULT NULL," +
                     "`address` varchar(100) DEFAULT NULL," +
                     "`households` int(100) DEFAULT NULL," +
                     "`buildingtype` varchar(20) DEFAULT NULL," +
                     "`email` varchar(30) DEFAULT NULL," +
                     "`phoneNumber` varchar(11) DEFAULT NULL," +
                     "`username` varchar(30) DEFAULT NULL," +
                     "`password` varchar(30) DEFAULT NULL," +
                     "`userLevel` int(1) NOT NULL DEFAULT '0'," +
                     "PRIMARY KEY (`id`)" +
                     ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
        
        jdbcTemplate.execute(sql);
    }
}
