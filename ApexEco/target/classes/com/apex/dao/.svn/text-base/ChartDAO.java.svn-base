package com.apex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.stereotype.Component;

import com.apex.model.User;

/**
 * Class for communicating with database
 * 
 * @author mahesh
 * @version 1.0
 */
@Component
public class ChartDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/**
	 * Method for getting user details
	 * 
	 * @param userId
	 *            passing user unique id
	 * @return User Pojo(i.e,user details)
	 */
	public User getUserDetails(int userId) {

		String sql = "SELECT id,user_name,first_name FROM user WHERE id = ?";

		Connection conn = null;

		try {
			/* calling getConnection() method for getting db connection */
			conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			User user = null;
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// System.out.println(rs.getInt("id"));
				// System.out.println(rs.getString("user_name"));
				// System.out.println(rs.getString("password"));
			}
			rs.close();
			ps.close();
			return user;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	/**
	 * Method for getting Connection with database
	 * 
	 * @return connection object
	 */
	private Connection getConnection() {
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/* added this for Temporarily */
	public User getCharData() {

		User user = new User();
		/*
		 * Connection conn = null; conn = getConnection(); CallableStatement
		 * callableStatement = null; String charProc = "{call procData(?,?)}";
		 * try { callableStatement = conn.prepareCall(charProc);
		 * callableStatement.setLong(1, 2013); callableStatement.setLong(2, 6);
		 * ResultSet resultSet = callableStatement.executeQuery();
		 * 
		 * } catch (Exception e) { }
		 */
		return user;
	}
}
