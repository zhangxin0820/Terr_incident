package com.zx.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.zx.db.DBConn;
import com.zx.model.Subincident;

public class SubincidentDao {
	public static void addSubincident(Subincident sub) throws SQLException {
		Connection conn = DBConn.getConnection();
		String sql = "insert into sub_incident (sub_event_id,terr_location,terr_measure,terr_sub_numberOfTerr,terr_sub_numberOfCas) values(?,?,?,?,?)";

		PreparedStatement ptmt = conn.prepareStatement(sql);

		//ptmt.setInt(1, sub.getSub_id());
		ptmt.setInt(1, sub.getSub_event_id());
		ptmt.setString(2, sub.getTerr_location());
		ptmt.setString(3, sub.getTerr_measure());
		ptmt.setInt(4, sub.getTerr_sub_numberOfTerr());
		ptmt.setInt(5, sub.getTerr_sub_numberOfCas());
		ptmt.executeUpdate();
	}

	public static void updateSubincident(Subincident sub) throws SQLException {
		Connection conn = DBConn.getConnection();
		String sql = "update sub_incident set terr_location=?,terr_measure=?,"
				+ "terr_sub_numberOfTerr=?,terr_sub_numberOfCas=? where sub_id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);

		ptmt.setString(1, sub.getTerr_location());
		ptmt.setString(2, sub.getTerr_measure());
		ptmt.setInt(3, sub.getTerr_sub_numberOfTerr());
		ptmt.setInt(4, sub.getTerr_sub_numberOfCas());
		ptmt.setInt(5, sub.getSub_id());
		ptmt.execute();
	}

	public static void delSubincident(String[] sub_id) throws SQLException {
		Connection conn = DBConn.getConnection();
		int n = sub_id.length;
		for (int i = 0; i < n; i++) {
			int tempId = Integer.parseInt(sub_id[i]);
			String sql = "delete from sub_incident where sub_id=?";
			PreparedStatement ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, tempId);
			ptmt.execute();
		}
	}

	public static List<Subincident> getsubAll(int sub_event_id) throws SQLException {
		List<Subincident> result = new LinkedList<Subincident>();

		Connection conn = DBConn.getConnection();
		String sql = "select * from sub_incident where sub_event_id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ptmt.setInt(1, sub_event_id);
		ResultSet rs = ptmt.executeQuery();

		while (rs.next()) {
			Subincident sub = new Subincident();

			sub.setSub_id(rs.getInt("sub_id"));
			sub.setSub_event_id(rs.getInt("sub_event_id"));
			sub.setTerr_location(rs.getString("terr_location"));
			sub.setTerr_measure(rs.getString("terr_measure"));
			sub.setTerr_sub_numberOfTerr(rs.getInt("terr_sub_numberOfTerr"));
			sub.setTerr_sub_numberOfCas(rs.getInt("terr_sub_numberOfCas"));
			result.add(sub);
		}

		return result;
	}

}
