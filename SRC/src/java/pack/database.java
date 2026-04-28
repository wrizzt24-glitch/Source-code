package pack;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class database {

	private static String envOrDefault(String key, String defaultValue) {
		String value = System.getenv(key);
		if (value == null || value.trim().isEmpty()) {
			return defaultValue;
		}
		return value.trim();
	}

    public Connection fun() throws Exception {
        // Force-load the NEW MySQL 8 driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Deregister any OLD MySQL 5.x drivers that might have auto-loaded
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver d = drivers.nextElement();
            String driverClass = d.getClass().getName();
            // Remove old driver but keep the new one
            if (driverClass.equals("com.mysql.jdbc.Driver") || 
                driverClass.equals("com.mysql.jdbc.NonRegisteringDriver")) {
                System.out.println("Deregistering old MySQL driver: " + driverClass);
                DriverManager.deregisterDriver(d);
            }
        }
        
        String dbUrl = envOrDefault("DB_URL", "jdbc:mysql://localhost:3307/enabling");
        
        // Auto-convert Railway's mysql:// format to JDBC format if needed
        if (dbUrl.startsWith("mysql://")) {
            dbUrl = "jdbc:" + dbUrl;
        }
        
        // Fix SSL and auth issues for modern MySQL 8 databases
        if (dbUrl.contains("?")) {
            dbUrl += "&useSSL=false&allowPublicKeyRetrieval=true";
        } else {
            dbUrl += "?useSSL=false&allowPublicKeyRetrieval=true";
        }
        
        String dbUser = envOrDefault("DB_USER", "root");
        String dbPass = envOrDefault("DB_PASS", "root");
        
        System.out.println("Attempting DB connection to: " + dbUrl + " with user: " + dbUser);
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        System.out.println("---Connection created!----");
        return con;
    }
}
