package com.opt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opt.biz.OPTBizImpl;
import com.opt.dto.VideoClipDto;
import com.opt.dto.VideoComment;

@WebServlet("/video.do")
public class OptVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		System.out.println("[ video.do?" + command + " ]");
		OPTBizImpl biz = new OPTBizImpl();
		if (command.equals("videoList")) {
			System.out.println(Integer.parseInt(request.getParameter("page")));
			int page = Integer.parseInt(request.getParameter("page"));
			int allCount = biz.selectVideoList().size();
			int listCount = 10;
			int totalPage = (allCount - 1) / listCount + 1;
			int blockCount = 5;
			int absolutePage = 0;
			int endPage = 0;

			if (page < 1) {
				page = 1;

			} else if (page > totalPage) {
				page = totalPage;
			}

			if (page % 5 == 0) {
				absolutePage = ((page / 5) * 5) - 4;
				endPage = (page / 5) * 5;

			} else {
				absolutePage = ((page / 5) * 5) + 1;
				endPage = ((page / 5) * 5) + 5;
			}

			if (endPage > totalPage) {
				endPage = totalPage;
			}

			int start = (page - 1) * listCount + 1;
			int end = page * listCount;
			System.out.println("start >> " + start);
			System.out.println("end >> " + end);
			request.setAttribute("list", biz.videoListPage(start, end));
			request.setAttribute("page", page);
			request.setAttribute("blockCount", blockCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("absolutePage", absolutePage);
			request.setAttribute("endPage", endPage);

			dispatch(request, response, "videoboard.jsp");

		} else if (command.equals("videoDetail")) {
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);
			
			biz.videoCount(no);
			
			VideoClipDto VideoDto = biz.videoSelectOne(no);
			List<VideoComment> list = biz.videoCommentList(no);
			System.out.println(list.toString());
			request.setAttribute("VideoDto", VideoDto);
			request.setAttribute("list",list);

			dispatch(request, response, "videodetail.jsp");
			
		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	

}
