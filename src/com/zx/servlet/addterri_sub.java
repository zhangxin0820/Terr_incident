package com.zx.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zx.dao.SubincidentDao;
import com.zx.model.Subincident;

/**
 * Servlet implementation class addterri_sub
 */
@WebServlet("/addterri_sub")
public class addterri_sub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addterri_sub() {
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
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		//int sub_id = Integer.parseInt(request.getParameter("sub_id"));
		int sub_event_id = Integer.parseInt(request.getParameter("sub_event_id"));
		String terr_location = new String(request.getParameter("terr_location").toString());
		String terr_measure = new String(request.getParameter("terr_measure").toString());
		int terr_sub_numberOfTerr = Integer.parseInt(request.getParameter("terr_sub_numberOfTerr"));
		int terr_sub_numberOfCas = Integer.parseInt(request.getParameter("terr_sub_numberOfCas"));
		
		Subincident subincident = new Subincident();
		
		//subincident.setSub_id(sub_id);
		subincident.setSub_event_id(sub_event_id);
		subincident.setTerr_location(terr_location);
		subincident.setTerr_measure(terr_measure);
		subincident.setTerr_sub_numberOfTerr(terr_sub_numberOfTerr);
		subincident.setTerr_sub_numberOfCas(terr_sub_numberOfCas);
		
		try {
			SubincidentDao.addSubincident(subincident);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("showsubAll.jsp?id=" + sub_event_id);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/showsubAll.jsp");
		//dispatcher.forward(request, response);
	}

}
