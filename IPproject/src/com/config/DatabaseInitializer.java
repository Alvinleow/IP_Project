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
        createUserTable();
        createWaterTable();
        createElectricityTable();
        createWasteTable();
        createOilTable();
    }
    
    private void createUserTable() {
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
    
    private void createWaterTable() {
        String sql = "CREATE TABLE IF NOT EXISTS water_bills(" + 
        		"`id` INT AUTO_INCREMENT PRIMARY KEY," + 
        		"`user_id` INT NOT NULL," + 
        		"`consumption` DECIMAL(10, 2) NOT NULL," + 
        		"`bill_month` VARCHAR(255) NOT NULL," + 
        		"`file_content` LONGBLOB," + 
        		"`verify_status` VARCHAR(10) DEFAULT 'No'," +
        		" FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE" + 
        		") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
        jdbcTemplate.execute(sql);
    }
    
    private void createElectricityTable() {
        String sql = "CREATE TABLE IF NOT EXISTS electricity_bills(" + 
        		"`id` INT AUTO_INCREMENT PRIMARY KEY," +
        	    "`user_id` INT NOT NULL," +
        	    "`consumption` DECIMAL(10, 2) NOT NULL," +
        	    "`bill_month` VARCHAR(255) NOT NULL," +
        	    "`file_content` LONGBLOB, " +
        	    "`verify_status` VARCHAR(10) DEFAULT 'No'," +
        	    " FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE" +
        	    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
        jdbcTemplate.execute(sql);
    }
    
    private void createOilTable() {
        String sql = "CREATE TABLE IF NOT EXISTS cooking_oil_bills (" + 
        		"`id` INT AUTO_INCREMENT PRIMARY KEY,\r\n" + 
        		"`user_id` INT NOT NULL," + 
        		"`recycling_days` INT NOT NULL," + 
        		"`volume` DECIMAL(10, 2) NOT NULL," + 
        		"`bill_month` VARCHAR(255) NOT NULL," + 
        		"`file_content` LONGBLOB,\r\n" + 
        		"`verify_status` VARCHAR(10) DEFAULT 'No'," +
        		"FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE" + 
        		") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
        jdbcTemplate.execute(sql);
    }
    
    private void createWasteTable() {
        String sql = "CREATE TABLE IF NOT EXISTS waste_bills (" + 
        		"`id` INT AUTO_INCREMENT PRIMARY KEY," + 
        		"`user_id` INT NOT NULL," + 
        		"`days_produced` INT NOT NULL," + 
        		"`weight` DECIMAL(10, 2) NOT NULL," + 
        		"`bill_month` VARCHAR(255) NOT NULL," + 
        		"`verify_status` VARCHAR(10) DEFAULT 'No'," +
        		"FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE" + 
        		") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";
        jdbcTemplate.execute(sql);
    }
}
