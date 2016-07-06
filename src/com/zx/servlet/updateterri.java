package com.zx.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zx.dao.TerrincidentDao;
import com.zx.model.Terrincident;

/**
 * Servlet implementation class updateterri
 */
@WebServlet("/updateterri")
public class updateterri extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateterri() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));

		String tempterr_date = new String(request.getParameter("terr_date").toString());
		Date terr_date = Date.valueOf(tempterr_date);

		String terr_state = new String(request.getParameter("terr_state").toString());
		String terr_organization = new String(request.getParameter("terr_organization").toString());
		int terr_numberOfTerr = Integer.parseInt(request.getParameter("terr_numberOfTerr"));
		int terr_numberOfCas = Integer.parseInt(request.getParameter("terr_numberOfCas"));
		String terr_crimeForm = new String(request.getParameter("terr_crimeForm").toString());
		String terr_influence = new String(request.getParameter("terr_influence").toString());

		Terrincident terrincident = new Terrincident();

		terrincident.setTerr_date(terr_date);
		terrincident.setTerr_state(terr_state);
		terrincident.setTerr_organization(terr_organization);
		terrincident.setTerr_numberOfTerr(terr_numberOfTerr);
		terrincident.setTerr_numberOfCas(terr_numberOfCas);
		terrincident.setTerr_crimeForm(terr_crimeForm);
		terrincident.setTerr_influence(terr_influence);
		terrincident.setId(id);

		try {
			TerrincidentDao.updateTerrincident(terrincident);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// String result = "更新成功!";
		PrintWriter out = response.getWriter();
		out.write("{'status':'Success!'}");
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("/showAllInfo.jsp");
		// dispatcher.forward(request, response);
		// doGet(request, response);
	}

}
