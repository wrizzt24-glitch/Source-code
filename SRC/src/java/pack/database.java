/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ADMIN
 */
public class database {

	private static String envOrDefault(String key, String defaultValue) {
		String value = System.getenv(key);
		if (value == null || value.trim().isEmpty()) {
			return defaultValue;
		}
		return value.trim();
	}

    public Connection fun()
            {
                Connection con = null;
		try
		{ 
			Class.forName(envOrDefault("DB_DRIVER", "com.mysql.jdbc.Driver"));
			String dbUrl = envOrDefault("DB_URL", "jdbc:mysql://localhost:3307/enabling");
			String dbUser = envOrDefault("DB_USER", "root");
			String dbPass = envOrDefault("DB_PASS", "root");
			con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("---Connection created!----");
                }
                catch (Exception e) 
                {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
                return con;
	    }
}
