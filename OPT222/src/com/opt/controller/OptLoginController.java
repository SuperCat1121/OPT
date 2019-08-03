package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.opt.dto.MemberDto;


@WebServlet("/login.do")
public class OptLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		String command = request.getParameter("command");
		System.out.println("[ login.do?" + command + " ]");
		
		OPTBiz biz = new OPTBizImpl();
		PrintWriter out = response.getWriter();
		// 로그아웃
		if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("memdto");
			dispatch(request, response, "index.jsp");
		// 로그인
		} else if(command.equals("login")) {
			String id = request.getParameter("id"); // 입력 아디디
			String pw = request.getParameter("pw"); // 입력 패스워드

			String hidden_chk = request.getParameter("hidden_chk");	//체크시 on 안되면 null
			MemberDto login = biz.login(id, pw); // 로그인 시도
			System.out.println(login.getOpt_id());
			// 로그인 안됨, 아이디, 비밀번호 미입력
			if(login == null && id.equals("") && pw.equals("")) {
				response.sendRedirect("opt.do?command=login");
			// 아이디, 비밀번호 입력했으나 로그인 실패
			} else if(login == null && !id.equals("") && !pw.equals("")) {
				dispatch(request, response, "login.jsp?res=fail");
			// 로그인 성공, 계정이 활성화 된 상태
			} else if(login.getOpt_enabled().equals("Y")){
				HttpSession session = request.getSession();
				session.setAttribute("memdto", login);
				session.setAttribute("id", login.getOpt_id());
				session.setAttribute("opt_no", login.getOpt_no_seq());
				session.setMaxInactiveInterval(3600);
				// 관리자 계정일 때 관리자페이지로 이동
				if(login.getOpt_role().equals("admin")) {
					dispatch(request, response, "admin.jsp");
				// 유저 계정일 때 유저페이지로 이동
				} else if(login.getOpt_role().equals("user")) {
					if(hidden_chk.equals("Y")) {
					    Cookie c = new Cookie("idSave", id);
					    c.setMaxAge(60*60*24); // 쿠키 유효기간을 설정한다. 초단위 : 60*60*24= 1일
					    response.addCookie(c); // 응답헤더에 쿠키를 추가한다.
					} else {
					    Cookie c = new Cookie("idSave", "");
					    c.setMaxAge(60*60*24);
					    response.addCookie(c);
					}
					// Flag
					// 0 : index
					// 1 : mypage
					// 2 : payment
					int Flag = Integer.parseInt(request.getParameter("Flag"));
					if(Flag == 0) {
						dispatch(request, response, "index.jsp?");
					} else if(Flag == 1) {
						response.sendRedirect("opt.do?command=mypage");
					} else if(Flag == 2) {
						int itemNo = Integer.parseInt(request.getParameter("no"));
						int itemEa = Integer.parseInt(request.getParameter("ea"));
						dispatch(request, response, "item.do?command=payment&Flag=2&no="+itemNo+"&ea="+itemEa);
					}
					//회원정보수정
					if(command.equals("registchange")) {
						dispatch(request, response, "regist_change_enter.jsp");
					}
				}
			} else if(login.getOpt_enabled().equals("N")){
				dispatch(request, response, "login.jsp?res=fail");
			}
			
			
			
		}
		
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response,String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
