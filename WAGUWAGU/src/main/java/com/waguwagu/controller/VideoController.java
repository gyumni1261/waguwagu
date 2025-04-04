package com.waguwagu.controller;

import java.io.IOException;

import com.waguwagu.service.VideoService;
import com.waguwagu.service.VideoServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/video")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private VideoService service = VideoServiceImpl.getInstance();

	protected void seervice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");
		
		switch(act) {
		case "viewCnt":
			doListByViewCnt(request, response);
			break;
		case "regTime":
			doListByRegTime(request, response);
			break;
		case "pickCnt":
			doListByPickCnt(request, response);
			break;
		case "cat":
			doListByCat(request, response);
			break;
		default:
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
			break;
		}

	}

	private void doListByViewCnt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("videoList", service.getListByPickCnt());
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void doListByRegTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("videoList", service.getListByRegTime());
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	private void doListByPickCnt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("videoList", service.getListByPickCnt());
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	private void doListByCat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat = request.getParameter("category");
		request.setAttribute("videoList", service.getListOfCat(cat));
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
