package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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
import com.opt.dto.ItemDto;
import com.opt.dto.MemberDto;
import com.opt.dto.PaymentDto;


@WebServlet("/opt.do")
public class OptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[ " + command + " ]");
		OPTBiz biz = new OPTBizImpl();
		PrintWriter out = response.getWriter();

		if(command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println("id >> " + id);
			System.out.println("pw >> " + pw);
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
					System.out.println("어드민");
				}else if(login.getOpt_role().equals("user")) {
					dispatch(request, response, "user.jsp");
					System.out.println("회원");
				}
			}else if(login.getOpt_enabled().equals("N")){
				dispatch(request, response, "login.jsp?res=fail");
			}
		} else if(command.equals("admin")) {
			Calendar cal = Calendar.getInstance();
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DATE);
			int monthSales = 0;
			int todaySales = 0;
			int alertItemCount = 0;
			List<ItemDto> itemList = biz.itemList();
			List<MemberDto> userList = biz.selectList();
			List<PaymentDto> paymentList = biz.paymentList();
			// 월별 판매건수 / 일일 판매건수
			for(PaymentDto dto : paymentList) {
				if(dto.getPay_regdate().getMonth()+1 == month) {
					monthSales++;
				}
				if(dto.getPay_regdate().getDate() == day) {
					todaySales++;
				}
			}
			// 재고부족 현황
			for(ItemDto dto : itemList) {
				if(dto.getItem_count() < 5) {
					alertItemCount++;
				}
			}
			request.setAttribute("itemList", itemList);
			request.setAttribute("userList", userList);
			request.setAttribute("monthSales", monthSales);
			request.setAttribute("todaySales", todaySales);
			request.setAttribute("alertItemCount", alertItemCount);
			dispatch(request, response, "admin.jsp");
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
