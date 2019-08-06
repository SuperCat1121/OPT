package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		} else if(command.equals("adminUserUpdate")) {
			String id = request.getParameter("id");
			String enabled = request.getParameter("enabled");
			String role = request.getParameter("role");
			int res = biz.adminUserUpdate(id, enabled, role);
			out.print("유저 수정 완료");
		} else if(command.equals("adminItemManager")) {
			List<ItemDto> list = biz.itemList();
			request.setAttribute("itemList", list);
			dispatch(request, response, "admin_item_manager.jsp");
		} else if(command.equals("adminItemUpdate")) {
			String item_num_seq = request.getParameter("item_num_seq");
			String item_name = request.getParameter("item_name");
			String item_price = request.getParameter("item_price");
			String item_content = request.getParameter("item_content");
			request.setAttribute("item_num_seq", item_num_seq);
			request.setAttribute("item_name", item_name);
			request.setAttribute("item_price", item_price);
			request.setAttribute("item_content", item_content);
			dispatch(request, response, "admin_Item_Update_Form.jsp");
		} else if(command.equals("adminItemUpdateRes")) {
			String item_num_seq = request.getParameter("item_num_seq");
			String item_name = request.getParameter("item_name");
			String item_price = request.getParameter("item_price");
			String item_content = request.getParameter("item_content");
			System.out.println(item_name);
			Map<String, String> update = new HashMap<String, String>();
			update.put("item_num_seq", item_num_seq);
			update.put("item_name", item_name);
			update.put("item_price", item_price);
			update.put("item_content", item_content);
			int res = biz.adminItemUpdate(update);
			if(res > 0) {
				out.print("<script type='text/javascript'>");
				out.print("alert('상품 수정 완료')");
				out.print("</script>");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('상품 수정 실패')");
				out.print("</script>");
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
