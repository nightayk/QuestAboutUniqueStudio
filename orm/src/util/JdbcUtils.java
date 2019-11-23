package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class JdbcUtils {

	public static void free(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		if (rs != null) {
            rs.close();
        }
        if (ps != null) {
        	ps.close();
        }
        if (conn != null) {
            conn.close();
        }
		
	}

	public static Connection getConnection(){
        String DRIVER = PropertiesUtil.readValue("jdbc.driverClassName");
        try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String URL = PropertiesUtil.readValue("jdbc.url");
        String NAME = PropertiesUtil.readValue("jdbc.username");
        String PWD = PropertiesUtil.readValue("jdbc.password");
        Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, NAME, PWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

}
