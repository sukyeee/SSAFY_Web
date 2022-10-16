package map.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBManager {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// context.xml 
			Context context = (Context) new InitialContext().lookup("java:comp/env/");
			// Resource  jdbc/board 
			DataSource dataSource = (DataSource) context.lookup("jdbc/my_house"); // dataSource == Connetcion Pool
			conn = dataSource.getConnection();
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static void releaseConnection(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try{
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			//e.printStackTrace();
		}
	}
}
