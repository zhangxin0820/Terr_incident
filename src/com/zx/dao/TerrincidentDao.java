package com.zx.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;

import com.zx.model.Terrincident;
import com.zx.db.DBConn;

public class TerrincidentDao {
	public static void addTerrincident(Terrincident terr) throws Exception {
		Connection conn = DBConn.getConnection();
		String sql = "insert into terr_incident (terr_date,terr_state,terr_organization,terr_numberOfTerr,terr_numberOfCas,terr_crimeForm,terr_influence) values(?,?,?,?,?,?,?)";

		PreparedStatement ptmt = conn.prepareStatement(sql);

		//ptmt.setInt(1, terr.getId());
		ptmt.setDate(1, terr.getTerr_date());
		ptmt.setString(2, terr.getTerr_state());
		ptmt.setString(3, terr.getTerr_organization());
		ptmt.setInt(4, terr.getTerr_numberOfTerr());
		ptmt.setInt(5, terr.getTerr_numberOfCas());
		ptmt.setString(6, terr.getTerr_crimeForm());
		ptmt.setString(7, terr.getTerr_influence());
		ptmt.executeUpdate();
		
	}

	public static void updateTerrincident(Terrincident terr) throws SQLException {
		Connection conn = DBConn.getConnection();
		String sql = "update terr_incident set terr_date=?,terr_state=?,"
				+ "terr_organization=?,terr_numberOfTerr=?,terr_numberOfCas=?,"
				+ "terr_crimeForm=?,terr_influence=? where id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);

		ptmt.setDate(1, terr.getTerr_date());
		ptmt.setString(2, terr.getTerr_state());
		ptmt.setString(3, terr.getTerr_organization());
		ptmt.setInt(4, terr.getTerr_numberOfTerr());
		ptmt.setInt(5, terr.getTerr_numberOfCas());
		ptmt.setString(6, terr.getTerr_crimeForm());
		ptmt.setString(7, terr.getTerr_influence());
		ptmt.setInt(8, terr.getId());
		ptmt.execute();
	}

	public static void delTerrincident(String[] id) throws SQLException {
		Connection conn = DBConn.getConnection();
		int n = id.length;
		for (int i = 0; i < n; i++) {
			int tempId = Integer.parseInt(id[i]);
			String sql = "delete from terr_incident where id=?";
			String sql_sub = "delete from sub_incident where sub_event_id=?";
			String sql_crim = "delete from terr_criminal where event_id=?";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			PreparedStatement ptmt_sub = conn.prepareStatement(sql_sub);
			PreparedStatement ptmt_crim = conn.prepareStatement(sql_crim);

			ptmt.setInt(1, tempId);
			ptmt_sub.setInt(1, tempId);
			ptmt_crim.setInt(1, tempId);
			ptmt_crim.execute();
			ptmt_sub.execute();
			ptmt.execute();
		}
	}

	public static List<Terrincident> getAll() throws SQLException {
		List<Terrincident> result = new LinkedList<Terrincident>();

		Connection conn = DBConn.getConnection();
		String sql = "select * from terr_incident order by terr_date desc";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();

		while (rs.next()) {
			Terrincident terr = new Terrincident();

			terr.setId(rs.getInt("id"));
			terr.setTerr_date(rs.getDate("terr_date"));
			terr.setTerr_state(rs.getString("terr_state"));
			terr.setTerr_organization(rs.getString("terr_organization"));
			terr.setTerr_numberOfTerr(rs.getInt("terr_numberOfTerr"));
			terr.setTerr_numberOfCas(rs.getInt("terr_numberOfCas"));
			terr.setTerr_crimeForm(rs.getString("terr_crimeForm"));
			terr.setTerr_influence(rs.getString("terr_influence"));
			result.add(terr);
		}

		return result;
	}

	// 集合接受符合的数据
	public static List<Terrincident> getAll(String state) throws Exception {
		List<Terrincident> result = new ArrayList<Terrincident>();

		Connection conn = DBConn.getConnection();
		StringBuilder build = new StringBuilder();
		build.append("select * from terr_incident where terr_state like ? order by terr_date desc");

		PreparedStatement ptmt = conn.prepareStatement(build.toString());
		ptmt.setString(1, "%" + state + "%");
		ResultSet rs = ptmt.executeQuery();

		while (rs.next()) {
			Terrincident terr = new Terrincident();

			terr.setId(rs.getInt("id"));
			terr.setTerr_date(rs.getDate("terr_date"));
			terr.setTerr_state(rs.getString("terr_state"));
			terr.setTerr_organization(rs.getString("terr_organization"));
			terr.setTerr_numberOfTerr(rs.getInt("terr_numberOfTerr"));
			terr.setTerr_numberOfCas(rs.getInt("terr_numberOfCas"));
			terr.setTerr_crimeForm(rs.getString("terr_crimeForm"));
			terr.setTerr_influence(rs.getString("terr_influence"));

			result.add(terr);
		}

		return result;
	}

	public static List<Terrincident> getAll(Date date1, Date date2) throws Exception {
		List<Terrincident> result = new ArrayList<Terrincident>();

		Connection conn = DBConn.getConnection();
		StringBuilder build = new StringBuilder();
		build.append("select * from terr_incident where terr_date between ? and ? order by terr_date desc");

		PreparedStatement ptmt = conn.prepareStatement(build.toString());
		ptmt.setDate(1, date1);
		ptmt.setDate(2, date2);
		ResultSet rs = ptmt.executeQuery();

		Terrincident terr = null;
		while (rs.next()) {
			terr = new Terrincident();
			terr.setId(rs.getInt("id"));
			terr.setTerr_date(rs.getDate("terr_date"));
			terr.setTerr_state(rs.getString("terr_state"));
			terr.setTerr_organization(rs.getString("terr_organization"));
			terr.setTerr_numberOfTerr(rs.getInt("terr_numberOfTerr"));
			terr.setTerr_numberOfCas(rs.getInt("terr_numberOfCas"));
			terr.setTerr_crimeForm(rs.getString("terr_crimeForm"));
			terr.setTerr_influence(rs.getString("terr_influence"));

			result.add(terr);
		}

		return result;
	}

	public static List<Terrincident> getAll(String state, Date date1, Date date2) throws Exception {
		List<Terrincident> result = new ArrayList<Terrincident>();

		Connection conn = DBConn.getConnection();
		StringBuilder build = new StringBuilder();
		build.append(
				"select * from terr_incident where terr_state like ? and terr_date between ? and ? order by terr_date desc");

		PreparedStatement ptmt = conn.prepareStatement(build.toString());
		ptmt.setString(1, "%" + state + "%");
		ptmt.setDate(2, date1);
		ptmt.setDate(3, date2);
		ResultSet rs = ptmt.executeQuery();

		while (rs.next()) {
			Terrincident terr = new Terrincident();
			terr.setId(rs.getInt("id"));
			terr.setTerr_date(rs.getDate("terr_date"));
			terr.setTerr_state(rs.getString("terr_state"));
			terr.setTerr_organization(rs.getString("terr_organization"));
			terr.setTerr_numberOfTerr(rs.getInt("terr_numberOfTerr"));
			terr.setTerr_numberOfCas(rs.getInt("terr_numberOfCas"));
			terr.setTerr_crimeForm(rs.getString("terr_crimeForm"));
			terr.setTerr_influence(rs.getString("terr_influence"));

			result.add(terr);
		}

		return result;
	}

	// 查询返回单条数据
	public Terrincident getOne(Integer id) throws SQLException {
		Terrincident terr = null;
		Connection conn = DBConn.getConnection();
		String sql = "" + "select * from terr_incident" + "where id=?";
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ptmt.setInt(1, id);
		ResultSet rs = ptmt.executeQuery();
		while (rs.next()) {
			terr = new Terrincident();

			terr.setId(rs.getInt("id"));
			terr.setTerr_date(rs.getDate("terr_date"));
			terr.setTerr_state(rs.getString("terr_state"));
			terr.setTerr_organization(rs.getString("terr_organization"));
			terr.setTerr_numberOfTerr(rs.getInt("terr_numberOfTerr"));
			terr.setTerr_numberOfCas(rs.getInt("terr_numberOfCas"));
			terr.setTerr_crimeForm(rs.getString("terr_crimeForm"));
			terr.setTerr_influence(rs.getString("terr_influence"));
		}

		return terr;
	}

}
