package com.opt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opt.biz.OPTBiz;
import com.opt.biz.OPTBizImpl;
import com.opt.dto.CouponDto;
import com.opt.dto.MemberDto;

/**
 * Servlet implementation class OptCouponController
 */
@WebServlet("/coupon.do")
public class OptCouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[ coupon.do?" + command + " ]");
		OPTBiz biz = new OPTBizImpl();
		if(command.equals("couponlist")) {
			HttpSession session = request.getSession();
			MemberDto memdto = (MemberDto)session.getAttribute("memdto");
			
			List<CouponDto> couponlist = biz.couponList(memdto.getOpt_no_seq());
			session.setAttribute("coupondto", couponlist);
			dispatch(request, response, "coupon_popup.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response,String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
