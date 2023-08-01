package jjapkorea.common.jdbc;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTemplate {
	private static Connection conn = null;
	
	// Singleton패턴  Connection 객체가 많이 생성됨을 방지
		public static Connection getConnection() {
			Properties prop = new Properties();
			String currentPath = JdbcTemplate.class.getResource("./").getPath();
			System.out.println("currentPath: "+currentPath);
	//
			try {
				// driver.properties 파일 로딩함.
				prop.load(new BufferedReader(new FileReader(currentPath+"driver.properties")));
				
				// 1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 오류 발생
				Class.forName(prop.getProperty("jdbc.driver"));
//				Class.forName("oracle.jdbc.driver.OracleDriver");
				// 2. Connection 객체 생성 // dbms와 연결
				conn = DriverManager.getConnection(prop.getProperty("jdbc.url"),prop.getProperty("jdbc.username"),prop.getProperty("jdbc.password"));
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jjapkorea","jjapkorea");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(conn!=null) {
				System.out.println("DB 연결 성공");
			}else {
				System.out.println("!!!!!!!!!!!DB 연결 실패!!!!!!!!!!!!!!!!!");
			}
			return conn;
		}
		public static Connection getConnectionKhl() {
			try {
				// 1. driver 있다면 로딩함. // 없다면 ClassNotFoundException 오류 발생
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// 2. Connection 객체 생성 // dbms와 연결
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","khl","khl");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(conn!=null) {
				System.out.println("DB 연결 성공");
			}else {
				System.out.println("!!!!!!!!!!!DB 연결 실패!!!!!!!!!!!!!!!!!");
			}
			return conn;
		}
		public static void close(Connection con) {
			try {
				if(con!=null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
//		public static void close(PreparedStatement pstmt) {
//			try {
//				if(pstmt!=null) {
//					pstmt.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
		public static void close(Statement stmt) {
			try {
				if(stmt!=null) {
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void close(ResultSet rset) {
			try {
				if(rset!=null) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public static void commit(Connection conn) {
			try {
				if(conn!=null) {
					conn.commit();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void rollback(Connection conn) {
			try {
				if(conn!=null) {
					conn.rollback();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void setAutoCommit(Connection conn, boolean autoCommit) {
			try {
				if(conn!=null) {
					conn.setAutoCommit(false);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
//	private static DataSource ds = null; // DataSource ds는 아파치톰캣(WAS)가 제공하는 DBCP(DB Connection Pool) 이다.
//	public static Connection getConnection() {
//		Connection conn = null;
//		try {
//			Context initCtxt = new InitialContext(); 
//			Context envCtxt = (Context)initCtxt.lookup("java:/comp/env");
//			DataSource ds = (DataSource)envCtxt.lookup("jdbc/jjapkorea");
//			conn = ds.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		if(conn != null) System.out.println("DBCP 연결성공");
//		else System.out.println("DBCP 연결실패");
//		return conn;
//	}
////	private static Connection conn = null;
////	Singleton
////	public static Connection getConnection() {
////		Properties prop = new Properties();
////		try {
////			String currentPath = JdbcTemplate.class.getResource("./").getPath();
////			prop.load(new BufferedReader(new FileReader(currentPath+"driver.properties")));
////			
////			Class.forName(prop.getProperty("driver"));
////			conn = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
////		} catch (Exception e) {
////			e.printStackTrace();
////		}
////		if(conn != null) System.out.println("DB 연결성공");
////		else System.out.println("DB 연결실패");
////		return conn;
////	}
//	public static void close(Connection conn) {
//		try {
//			if(conn != null) conn.close();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public static void close(Statement stmt) {
//		try {
//			if(stmt != null) stmt.close();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public static void close(ResultSet rs) {
//		try {
//			if(rs != null) rs.close();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public static void setAutoCommit(Connection conn, boolean autocommit) {
//		try {
//			if(conn != null) conn.setAutoCommit(autocommit);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public static void commit(Connection conn) {
//		try {
//			if(conn != null) conn.commit();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	public static void rollback(Connection conn) {
//		try {
//			if(conn != null) conn.rollback();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}