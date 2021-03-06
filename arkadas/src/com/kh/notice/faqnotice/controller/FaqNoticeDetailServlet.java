package com.kh.notice.faqnotice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.faqnotice.model.service.FaqNoticeService;
import com.kh.notice.faqnotice.model.vo.FaqNotice;
import com.kh.notice.mainnotice.model.service.MainNoticeService;
import com.kh.notice.mainnotice.model.vo.MainNotice;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/FaqNoticeDetail.no")
public class FaqNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqNoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int FnNo = Integer.parseInt(request.getParameter("FnNo"));
		
		FaqNotice faqNotice = new FaqNoticeService().selectNotice(FnNo);
		
		String page = "";
		if(faqNotice != null) {
			request.setAttribute("faqNotice", faqNotice);
			page = "views/notice/faqnotice/FaqNoticeDetail.jsp";
		}else {
			request.setAttribute("msg", "질문 조회에 실패했습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
