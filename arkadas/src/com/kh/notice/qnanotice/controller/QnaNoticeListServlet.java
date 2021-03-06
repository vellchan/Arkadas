package com.kh.notice.qnanotice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.notice.qnanotice.model.service.QnaNoticeService;
import com.kh.notice.qnanotice.model.vo.QnaNotice;

/**
 * Servlet implementation class QnaNoticeListServlet
 */
@WebServlet("/QnaNotice.no")
public class QnaNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		
		String condition = "";
		String user    = "";
		String title   = "";
		String content = "";
		
		if(request.getParameter("condition") != null)
			condition = (String) request.getParameter("condition");
		
		/*if(request.getParameter("user") != null)
			user = (String) request.getParameter("user");*/
		
		
		
		if(condition.equals("content")) {
			content = request.getParameter("search");
		}
		
		if(condition.equals("title")) {
			title = request.getParameter("search");
		}
		
		if(condition.equals("writer")) {
			user = request.getParameter("search");
		}
		
		
		
		System.out.println(String.format("==== %s , %s , %s ====",user,title, content));
		
		ArrayList<QnaNotice> list = new QnaNoticeService().selectList(user, title, content);
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/notice/qnanotice/QnaNotice.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		doGet(request, response);
	}

}
