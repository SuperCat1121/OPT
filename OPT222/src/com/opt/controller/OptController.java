package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opt.biz.OPTBiz;
import com.opt.biz.OPTBizImpl;
import com.opt.dao.OPTDao;
import com.opt.dto.MemberDto;
import com.opt.dto.OrderListDto;


@WebServlet("/opt.do")
public class OptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[ " + command + " ]");
		OPTBiz biz = new OPTBizImpl();
		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String hidden_chk = request.getParameter("hidden_chk");	//체크시 on 안되면 null
			MemberDto login = biz.login(id, pw);
			
			
			if(login == null && id.equals("") && pw.equals("")) {
				response.sendRedirect("opt.do?command=login");
			}else if(login == null && !id.equals("") && !pw.equals("")) {
				
				dispatch(request, response, "login.jsp?res=fail");
			
			}else if(login.getOpt_enabled().equals("Y")){
				
				HttpSession session = request.getSession();
				session.setAttribute("memdto", login);
				
				session.setMaxInactiveInterval(3600);
				
				if(login.getOpt_role().equals("admin")) {
					dispatch(request, response, "admin.jsp");
				}else if(login.getOpt_role().equals("user")) {
					
					
					if(hidden_chk.equals("Y")) {
					    
					    Cookie c = new Cookie("idSave", id) ;
					    
					    c.setMaxAge(60*60*24) ; // 쿠키 유효기간을 설정한다. 초단위 : 60*60*24= 1일
					    
					    response.addCookie(c) ; // 응답헤더에 쿠키를 추가한다.
					}else {
					    Cookie c = new Cookie("idSave", "") ;
					    c.setMaxAge(60*60*24) ;
					    response.addCookie(c) ;
					}
					int pay_count = biz.pay_count(login.getOpt_no_seq());
					int coupon_count = biz.coupon_count(login.getOpt_no_seq());
					
					List<OrderListDto> list = new ArrayList<OrderListDto>();
					list = biz.orderList(login.getOpt_no_seq());
					
					session.setAttribute("orderdto", list);
					dispatch(request, response, "user.jsp?pay_count="+pay_count+"&coupon_count="+coupon_count);
					System.out.println("회원");
					//결제페이지 추가
					
					
				}
			}else if(login.getOpt_enabled().equals("N")){
				dispatch(request, response, "login.jsp?res=fail");
				
				
			}
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
