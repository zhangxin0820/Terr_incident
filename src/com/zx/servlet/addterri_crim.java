package com.zx.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zx.model.Terrcriminal;
import com.zx.dao.TerrcriminalDao;

/**
 * Servlet implementation class addterri_crim
 */
@WebServlet("/addterri_crim")
public class addterri_crim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addterri_crim() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		//int terr_id = Integer.parseInt(request.getParameter("terr_id"));
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		String terr_name = new String(request.getParameter("terr_name"));
		String terr_gender = new String(request.getParameter("terr_gender"));
		
		String tempterr_birthday = new String(request.getParameter("terr_birthday").toString());
		Date terr_birthday = Date.valueOf(tempterr_birthday);
		
		String terr_job = new String(request.getParameter("terr_job").toString());
		
		Terrcriminal terrcriminal = new Terrcriminal();
		
		//terrcriminal.setTerr_id(terr_id);
		terrcriminal.setEvent_id(event_id);
		terrcriminal.setTerr_name(terr_name);
		terrcriminal.setTerr_gender(terr_gender);
		terrcriminal.setTerr_birthday(terr_birthday);
		terrcriminal.setTerr_job(terr_job);
		
		try {
			TerrcriminalDao.addTerrcriminal(terrcriminal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("showcrimAll.jsp?id=" + event_id);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/showcrimAll.jsp");
		//dispatcher.forward(request, response);
	}

}
