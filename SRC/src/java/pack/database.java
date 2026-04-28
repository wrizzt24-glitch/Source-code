package pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class database {

	private static String envOrDefault(String key, String defaultValue) {
		String value = System.getenv(key);
		if (value == null || value.trim().isEmpty()) {
			return defaultValue;
		}
		return value.trim();
	}

    public Connection fun() {
        Connection con = null;
		try { 
			Class.forName(envOrDefault("DB_DRIVER", "com.mysql.jdbc.Driver"));
			String dbUrl = envOrDefault("DB_URL", "jdbc:mysql://localhost:3307/enabling");
			
			// Auto-convert Railway's mysql:// format to JDBC format if needed
			if (dbUrl.startsWith("mysql://")) {
				dbUrl = "jdbc:" + dbUrl;
			}
			
			String dbUser = envOrDefault("DB_USER", "root");
			String dbPass = envOrDefault("DB_PASS", "root");
			
			System.out.println("Attempting DB connection to: " + dbUrl + " with user: " + dbUser);
			con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("---Connection created!----");
        } catch (Exception e) {
			e.printStackTrace();
		}
        return con;
    }
}
