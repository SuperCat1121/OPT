package com.opt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opt.biz.OPTBiz;
import com.opt.biz.OPTBizImpl;
import com.opt.dto.BasketDto;
import com.opt.dto.PostboxDto;


@WebServlet("/postbox.do")
public class OptPostboxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[ postbox.do?" + command + " ]");
		OPTBiz biz = new OPTBizImpl();
		PrintWriter out = response.getWriter();
		
		
		// 받은 쪽지함
		if(command.equals("recivePostbox")) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			int page = Integer.parseInt(request.getParameter("page"));
			int allCount = biz.recivePostboxList(id).size();			

			
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
			request.setAttribute("list", biz.recivePostboxListPage(id, start, end));
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("allCount", allCount);
			
			dispatch(request, response, "recivePostbox.jsp");
			
			
		// 보낸 쪽지함	
		}else if(command.equals("sendPostbox")) {
			HttpSession session = request.getSession();
			int opt_no = ((Integer)(session.getAttribute("opt_no"))).intValue();
			int page = Integer.parseInt(request.getParameter("page"));
			int allCount = biz.sendPostboxList(opt_no).size();			
			
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
			request.setAttribute("list", biz.sendPostboxListPage(opt_no, start, end));
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("allCount", allCount);
			
			dispatch(request, response, "sendPostbox.jsp");

		// 받은쪽지 상세페이지
		}else if(command.equals("recivePostdetail")) {
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			int page = Integer.parseInt(request.getParameter("page"));
			String type = request.getParameter("type");
			
			PostboxDto postDto = biz.postboxDetail(post_no);
			biz.postboxRead(post_no);
			request.setAttribute("postDto", postDto);
			request.setAttribute("page", page);
			request.setAttribute("type", type);
			
			dispatch(request, response, "postdetail.jsp");
			
		// 보낸쪽지 상세페이지	
		}else if(command.equals("sendPostdetail")) {
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			int page = Integer.parseInt(request.getParameter("page"));
			String type = request.getParameter("type");
			
			PostboxDto postDto = biz.postboxDetail(post_no);
			request.setAttribute("postDto", postDto);
			request.setAttribute("page", page);
			request.setAttribute("type", type);
			
			dispatch(request, response, "postdetail.jsp");
			
		// 쪽지 삭제
		}else if(command.equals("delPost")) {
			int post_no = Integer.parseInt(request.getParameter("post_no"));
			int page = Integer.parseInt(request.getParameter("page")); 
			String type = request.getParameter("type");
			
			
			if(type.equals("recivePostbox")) {
				int res = biz.readDel(post_no);
				biz.allDel(post_no);

				if(res > 0) {
					alert("삭제성공", "postbox.do?command=recivePostbox&page=" + page, response);
				}else {
					alert("삭제실패", "postbox.do?command=recivePostbox&page=" + page, response);
				}
				
			}else if(type.equals("sendPostbox")) {
				int res = biz.sendDel(post_no);
				biz.allDel(post_no);
				
				if(res > 0) {
					alert("삭제성공", "postbox.do?command=sendPostbox&page=" + page, response);
				}else {
					alert("삭제실패", "postbox.do?command=sendPostbox&page=" + page, response);
				}
				
				
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
	
	public void alert(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.print("<script> alert('"+msg+"'); location.href='"+url+"'; </script>");
	}

}
