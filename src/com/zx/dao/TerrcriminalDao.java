package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.zx.db.DBConn;
import com.zx.model.Terrcriminal;

public class TerrcriminalDao {
	public static void addTerrcriminal(Terrcriminal crim) throws SQLException {
		Connection conn = DBConn.getConnection();
		String sql = "insert into terr_criminal (event_id,terr_name,terr_gender,terr_birthday,terr_job) values(?,?,?,?,?)";

		PreparedStatement ptmt = conn.prepareStatement(sql);

		//ptmt.setInt(1, crim.getTerr_id());
		ptmt.setInt(1, crim.getEvent_id());
		ptmt.setString(2, crim.getTerr_name());
		ptmt.setString(3, crim.getTerr_gender());
		ptmt.setDate(4, crim.getTerr_birthday());
		ptmt.setString(5, crim.getTerr_job());
		ptmt.executeUpdate();
	}

	public static void updateTerrcriminal(Terrcriminal crim) throws SQLException {
		Connection conn = DBConn.getConnection();
		String sql = "update terr_criminal set terr_name=?,terr_gender=?,"
				+ "terr_birthday=?,terr_job=? where terr_id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);

		ptmt.setString(1, crim.getTerr_name());
		ptmt.setString(2, crim.getTerr_gender());
		ptmt.setDate(3, crim.getTerr_birthday());
		ptmt.setString(4, crim.getTerr_job());
		ptmt.setInt(5, crim.getTerr_id());
		ptmt.execute();
	}

	public static void delTerrcriminal(String[] terr_id) throws SQLException {
		Connection conn = DBConn.getConnection();
		int n = terr_id.length;
		for (int i = 0; i < n; i++) {
			int tempId = Integer.parseInt(terr_id[i]);
			String sql = "delete from sub_incident where terr_id=?";
			PreparedStatement ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, tempId);
			ptmt.execute();
		}
	}

	public static List<Terrcriminal> getcrimAll(int event_id) throws SQLException {
		List<Terrcriminal> result = new LinkedList<Terrcriminal>();

		Connection conn = DBConn.getConnection();
		String sql = "select * from terr_criminal where event_id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ptmt.setInt(1, event_id);
		ResultSet rs = ptmt.executeQuery();

		while (rs.next()) {
			Terrcriminal crim = new Terrcriminal();

			crim.setTerr_id(rs.getInt("terr_id"));
			crim.setEvent_id(rs.getInt("event_id"));
			crim.setTerr_name(rs.getString("terr_name"));
			crim.setTerr_gender(rs.getString("terr_gender"));
			crim.setTerr_birthday(rs.getDate("terr_birthday"));
			crim.setTerr_job(rs.getString("terr_job"));
			result.add(crim);
		}
		return result;

	}

}
