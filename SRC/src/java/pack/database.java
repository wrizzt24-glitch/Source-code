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

    public Connection fun() throws Exception {
        Class.forName(envOrDefault("DB_DRIVER", "com.mysql.cj.jdbc.Driver"));
        String dbUrl = envOrDefault("DB_URL", "jdbc:mysql://localhost:3307/enabling");
        
        // Auto-convert Railway's mysql:// format to JDBC format if needed
        if (dbUrl.startsWith("mysql://")) {
            dbUrl = "jdbc:" + dbUrl;
        }
        
        // Fix SSLHandshakeException for older MySQL drivers connecting to modern databases
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
