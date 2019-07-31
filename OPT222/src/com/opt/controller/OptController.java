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
			
			// 2달전 판매 건수
			int twoMonthSales = 0;
			
			// 1달전 판매 건수
			int oneMonthSales = 0;
			
			// 2일전 판매 건수
			int twoDaySales = 0;
			
			// 1일전 판매 건수
			int oneDaySales = 0;
			
			// 재고가 5개 미만인 상품들의 개수
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
				if(dto.getPay_regdate().getMonth()+1 == month-2) {
					twoMonthSales++;
				}
				if(dto.getPay_regdate().getMonth()+1 == month-1) {
					oneMonthSales++;
				}
				if(dto.getPay_regdate().getDate() == day-2 && dto.getPay_regdate().getMonth()+1 == month) {
					twoDaySales++;
				}
				if(dto.getPay_regdate().getDate() == day-1 && dto.getPay_regdate().getMonth()+1 == month) {
					oneDaySales++;
				}
			}
			// 재고부족 현황
			for(ItemDto dto : itemList) {
				if(dto.getItem_count() < 5) {
					alertItemCount++;
				}
			}
			request.setAttribute("itemList", itemList);           // 상품 목록
			request.setAttribute("userList", userList);           // 유저 목록
			
			request.setAttribute("monthSales", monthSales);       // 이번달 판매량
			request.setAttribute("oneMonthSales", oneMonthSales); // 1달전 판매량
			request.setAttribute("twoMonthSales", twoMonthSales); // 2달전 판매량
			
			request.setAttribute("todaySales", todaySales);       // 오늘 판매량
			request.setAttribute("oneDaySales", oneDaySales);     // 1일전 판매량
			request.setAttribute("twoDaySales", twoDaySales);     // 2일전 판매량
			
			request.setAttribute("alertItemCount", alertItemCount); // 재고가 5개 이하인 제품들의 개수

			System.out.println("2달 전 : " + twoMonthSales);
			System.out.println("1달 전 : " + oneMonthSales);
			System.out.println("2일 전 : " + twoDaySales);
			System.out.println("1일 전 : " + oneDaySales);
			System.out.println("오늘 : " + todaySales);
			System.out.println("이번 달 : " + monthSales);
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
