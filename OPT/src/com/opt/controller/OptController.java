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
import com.opt.dao.OPTDao;
import com.opt.dto.MemberDto;


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
			MemberDto login = biz.login(id, pw);
			
			if(login == null) {
				dispatch(request, response, "login.jsp");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("memdto", login);
				
				session.setMaxInactiveInterval(3600);
				
				if(login.getOpt_role().equals("admin")) {
					dispatch(request, response, "admin.jsp");
					System.out.println("어드민");
				}else if(login.getOpt_role().equals("user")) {
					dispatch(request, response, "user.jsp");
					System.out.println("회원");
				}else if(login.getOpt_role()== null) {
					dispatch(request, response, "login.jsp");
				}
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
