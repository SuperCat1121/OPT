package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opt.biz.OPTBiz;
import com.opt.biz.OPTBizImpl;
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;

@WebServlet("/admin.do")
public class OptAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OptAdminController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		OPTBiz biz = new OPTBizImpl();
		PrintWriter out = response.getWriter();
		
		// (관리자)유저관리
		if(command.equals("adminUserManager")) {
			List<MemberDto> list = biz.selectList();
			request.setAttribute("memberList", list);
			dispatch(request, response, "admin_user_manager.jsp");
		// (유저관리)수정 버튼 누르면 유저 정보 업데이트 실행
		} else if(command.equals("adminUserManagerRes")) {
			String id = request.getParameter("id");
			String enabled = request.getParameter("enabled");
			String role = request.getParameter("role");
			int res = biz.adminUserUpdate(id, enabled, role);
			if(res > 0) {
				out.print("<script type='text/javascript'>");
				out.print("alert('해당 유저를 수정하였습니다');");
				out.print("</script>");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('시스템 오류입니다. 다시 시도해주세요');");
				out.print("</script>");
			}
		} else if(command.equals("adminItemManager")) {
			List<ItemDto> list = biz.itemList();
			request.setAttribute("itemList", list);
			dispatch(request, response, "admin_item_manager.jsp");
		} else if(command.equals("adminItemManagerRes")) {
			
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
