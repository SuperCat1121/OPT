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
import com.opt.dto.CouponDto;
import com.opt.dto.ItemDto;
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
						dispatch(request, response, "opt.do?command=payment");
					}
					//회원정보수정
					if(command.equals("registchange")) {
						dispatch(request, response, "regist_change_enter.jsp");
					}
					//결제페이지 추가
				}
			} else if(login.getOpt_enabled().equals("N")){
				dispatch(request, response, "login.jsp?res=fail");
			}
		// 마이페이지
		} else if(command.equals("mypage")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("memdto") == null) {
				response.sendRedirect("login.jsp?mypageFlag=1");
			} else {
				MemberDto memdto = (MemberDto)session.getAttribute("memdto");
				int pay_count = biz.pay_count(memdto.getOpt_no_seq());
				int coupon_count = biz.coupon_count(memdto.getOpt_no_seq());
				
				List<OrderListDto> orderList = new ArrayList<OrderListDto>();
				orderList = biz.orderList(memdto.getOpt_no_seq());
				
				session.setAttribute("orderdto", orderList);
				dispatch(request, response, "user.jsp?pay_count="+pay_count+"&coupon_count="+coupon_count);
			}
		// (관리자)유저관리
		} else if(command.equals("adminUserManager")) {
			List<MemberDto> list = biz.selectList();
			request.setAttribute("memberList", list);
			dispatch(request, response, "admin_user_manager.jsp");
		} else if(command.equals("adminUserManagerRes")) {
			String id = request.getParameter("id");
			String enabled = request.getParameter("enabled");
			String role = request.getParameter("role");
			int res = biz.adminUserUpdate(id, enabled, role);
			if(res > 0) {
				out.print("<script type='text/javascript'>");
				out.print("alert('해당 유저를 수정하였습니다');");
				out.print("location.href='opt.do?command=adminUserManager'");
				out.print("</script>");
			} else {
				out.print("<script type='text/javascript'>");
				out.print("alert('시스템 오류입니다. 다시 시도해주세요');");
				out.print("location.href='opt.do?command=adminUserManager'");
				out.print("</script>");
			}
			//상품페이지
		}else if(command.equals("itemlist")) {
			int page = Integer.parseInt(request.getParameter("page"));
			int allCount = biz.itemList().size();
			int listCount = 10;
			int totalPage = (allCount -1) / listCount + 1;
			int blockCount = 5;  
			int absolutePage = 0;
			int endPage = 0; 
			
			if(page < 1) {
				page = 1;
				
			}else if(page > totalPage) {
				page = totalPage;
			}
			
			if(page%5 == 0) {
				absolutePage = ((page/5) *5) -4;
				endPage = (page / 5) * 5;
				
			}else {
				absolutePage = ((page /5) *5)+1;
				endPage = ((page/5) * 5) + 5;
			}
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			
			int start = (page - 1)*listCount +1;
			int end = page * listCount;
			System.out.println("start >> " + start);
			System.out.println("end >> " + end);
			List<ItemDto> list = biz.itemPage(start, end);
			for(ItemDto dto : list) {
				System.out.println(dto.getItem_name());
				System.out.println(dto.getItem_price());
				System.out.println(dto.getItem_url());
			}
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);
			
			dispatch(request, response, "itemlist.jsp");
		}else if(command.equals("itemsearch")) {
			String keyword = request.getParameter("keyword");
			String msg = request.getParameter("msg");
			
			int page = Integer.parseInt(request.getParameter("page"));
			int allCount = biz.itemSearch(keyword, msg).size();			
			int listCount = 10;
			int totalPage = (allCount -1) / listCount + 1;
			int blockCount = 5;  
			int absolutePage = 0;
			int endPage = 0; 
			
			if(page < 1) {
				page = 1;
				
			}else if(page > totalPage) {
				page = totalPage;
			}
			
			if(page%5 == 0) {
				absolutePage = ((page/5) *5) -4;
				endPage = (page / 5) * 5;
				
			}else {
				absolutePage = ((page /5) *5)+1;
				endPage = ((page/5) * 5) + 5;
			}
			
			if(endPage > totalPage) {
				endPage = totalPage;
			}
			
			
			int start = (page - 1)*listCount +1;
			int end = page * listCount;
			System.out.println("start >> " + start);
			System.out.println("end >> " + end);
			request.setAttribute("list", biz.itemSearchPage(keyword, msg, start, end));			
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("keyword", keyword);
			request.setAttribute("msg", msg);
			
			
			dispatch(request, response, "itemsearch.jsp");
		}else if(command.equals("itemdetail")) {
			int page = Integer.parseInt(request.getParameter("page"));
			int no = Integer.parseInt(request.getParameter("no"));
			biz.itemCount(no);
			ItemDto dto = biz.itemSelect(no);
			request.setAttribute("page", page);
			request.setAttribute("dto", dto);
			dispatch(request, response, "itemdetail.jsp");			
		
		}else if(command.equals("payment")) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			
			if(id == null || id == "") {
				request.setAttribute("Flag", "2");
				int itemNo = Integer.parseInt(request.getParameter("no"));
				int itemEa = Integer.parseInt(request.getParameter("ea"));	
				dispatch(request, response, "opt.do?command=login");
			}else {
				int optNo = ((Integer)(session.getAttribute("opt_no"))).intValue();				
				List<CouponDto> couponList = biz.couponList(optNo);
				int itemNo = Integer.parseInt(request.getParameter("no"));
				int itemEa = Integer.parseInt(request.getParameter("ea"));			
				ItemDto itemDto = biz.itemSelect(itemNo);
				session.setAttribute("couponList", couponList);
				session.setAttribute("itemDto", itemDto);	
				session.setAttribute("ea", itemEa);	
				dispatch(request, response, "payment.jsp");
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
