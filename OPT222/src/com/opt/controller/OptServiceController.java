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
import com.opt.dto.CustomerServiceDto;

@WebServlet("/service.do")
public class OptServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String command = request.getParameter("command");
		System.out.println("[ service.do?" + command + " ]");
		OPTBiz biz = new OPTBizImpl();
		if(command.equals("servicelist")) {
			//List<CustomerServiceDto> list = biz.customerList();
			HttpSession session = request.getSession();
			

			int page = Integer.parseInt(request.getParameter("page")); //현재페이징번호
			int allCount = biz.customerList().size(); //전체게시글개수
			int listCount = 5; //한 화면에 뿌릴 데이터 개수
			int totalPage = (allCount -1) / listCount + 1; // 전체 페이지 개수
			int blockCount = 5;  // 이동을 위한 페이지 표시에 나타나는 숫자의 표시 갯수( 예 [1] [2] [3])
			int absolutePage = 0; // 페이지를 넘겼을 때 시작되는 첫번째 게시물의 시작 번호
			int endPage = 0;  // 페이지 마지막 번호
			
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
			List<CustomerServiceDto> list = biz.customerPaging(start, end);
			//request.setAttribute("list", list);
			session.setAttribute("customerdto", list);
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);
			
			
			
			dispatch(request, response, "customer.jsp");
		} else if (command.equals("insertres")) {
			int opt_no_seq = Integer.parseInt(request.getParameter("opt_no_seq"));
			String customer_title = request.getParameter("customer_title");
			String customer_content = request.getParameter("customer_content");
			CustomerServiceDto customerServiceDto = new CustomerServiceDto();
			customerServiceDto.setOpt_no_seq(opt_no_seq);
			customerServiceDto.setCustomer_title(customer_title);
			customerServiceDto.setCustomer_content(customer_content);
			int res = biz.insertCustomerBoard(customerServiceDto);
			if (res > 0) {
				dispatch(request, response, "service.do?command=servicelist&page=0");
			} else {
				dispatch(request, response, "customerwrite.jsp");
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
