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

import com.zx.dao.TerrcriminalDao;
import com.zx.model.Terrcriminal;

/**
 * Servlet implementation class updateterri_crim
 */
@WebServlet("/updateterri_crim")
public class updateterri_crim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateterri_crim() {
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
		int terr_id = Integer.parseInt(request.getParameter("terr_id"));
		// int event_id = Integer.parseInt(request.getParameter("event_id"));
		String terr_name = new String(request.getParameter("terr_name").toString());
		String terr_gender = new String(request.getParameter("terr_measure").toString());

		String tempterr_birthday = new String(request.getParameter("terr_birthday").toString());
		Date terr_birthday = Date.valueOf(tempterr_birthday);

		String terr_job = new String(request.getParameter("terr_birthday"));

		Terrcriminal terrcriminal = new Terrcriminal();

		terrcriminal.setTerr_id(terr_id);
		// terrcriminal.setEvent_id(event_id);
		terrcriminal.setTerr_name(terr_name);
		terrcriminal.setTerr_gender(terr_gender);
		terrcriminal.setTerr_birthday(terr_birthday);
		terrcriminal.setTerr_job(terr_job);

		try {
			TerrcriminalDao.updateTerrcriminal(terrcriminal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		out.write("{'status':'Success!'}");
		// doGet(request, response);
	}

}
