package com.waguwagu.controller;

import java.io.IOException;
import java.util.List;

import com.waguwagu.dto.Review;
import com.waguwagu.dto.User;
import com.waguwagu.service.ReviewService;
import com.waguwagu.service.ReviewServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewController() {
		super();
	}
	
	private ReviewService service = ReviewServiceImpl.getInstance();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		
		switch(act) {
		case "writeform":
			doWriteForm(request, response);
			break;
		case "write":
			doWrite(request, response);
			break;
		case "totallist":
			doTotalList(request, response);
			break;
		case "detail":
			doDetail(request, response);
			break;
		case "remove":
			doRemove(request, response);
			break;
		case "updateform":
			doUpdateForm(request, response);
			break;
		case "update":
			doUpdate(request, response);
			break;
		}
	}

	private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		String reviewContent = request.getParameter("reviewContent");

		request.setAttribute("videoId", videoId);
		request.setAttribute("reviewId", reviewId);
		//리뷰 불러오고 내용 수정해주기
		Review review = service.getReview(reviewId);
		review.setReviewContent(reviewContent);
		//리뷰 요청에 저장
		request.setAttribute("review", review);
		System.out.println(review.toString());
		//리뷰 수정 서비스 호출 - 여기부터~~~
		if(service.modifyReview(review)) {
			//리뷰 수정 성공 -> 해당 리뷰 상세 페이지로 이동
			request.setAttribute("errorMessage", "리뷰가 수정되었습니다.");
			request.getRequestDispatcher("/WEB-INF/review/detail.jsp").forward(request, response);
		}else {
			//리뷰 수정 실패 -> 리뷰 디테일로 이동
			request.setAttribute("errorMessage","알 수 없는 오류. 다시 시도해주세요.");
			//리뷰 번호에 맞는 상세 리뷰 정보 불러오기
			request.getRequestDispatcher("/WEB-INF/review/detail.jsp").forward(request, response);
		}
	}

	private void doUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loggedInUser");
		
		//리뷰 객체 불러오기
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = service.getReview(reviewId);
		//리뷰 객체 저장
		request.setAttribute("review", review);
		
		System.out.println(user==null);
		
		if(user!=null && user.getUserId().equals(review.getReviewWriter())) {
			//리뷰 수정 페이지로 이동
			request.getRequestDispatcher("/WEB-INF/review/updateform.jsp").forward(request, response);
		}else {
			//리뷰 수정 불가 -> 리뷰 상세 페이지로 이동
			request.setAttribute("errorMessage", "작성한 회원만 수정 가능합니다.");
			request.getRequestDispatcher("/WEB-INF/review/detail.jsp").forward(request, response);
		}
	}

	private void doRemove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		//리뷰 삭제 서비스 호출
		if(service.removeReview(reviewId)) {
			//리뷰 삭제 성공 -> 영상에 대한 전체 리뷰 목록 페이지로 이동
			request.setAttribute("errorMessage","리뷰가 삭제되었습니다.");
			//영상 번호에 맞는 모든 리뷰 목록 불러오기
			List<Review> videoIdList = service.getList(videoId);
			request.setAttribute("videoIdList", videoIdList);
			request.getRequestDispatcher("WEB-INF/review/list.jsp").forward(request, response);
		}else {
			//리뷰 삭제 실패 -> 리뷰 디테일로 이동
			request.setAttribute("errorMessage","알 수 없는 오류. 다시 시도해주세요.");
			//리뷰 번호에 맞는 상세 리뷰 정보 불러오기
			Review review = service.getReview(reviewId);
			request.setAttribute("review", review);
			request.getRequestDispatcher("/WEB-INF/review/detail.jsp").forward(request, response);
		}
		
	}

	private void doDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		
		//리뷰 번호에 맞는 상세 리뷰 정보 불러오기
		Review review = service.getReview(reviewId);
		
		System.out.println(review.toString());
		
		request.setAttribute("review", review);
		request.getRequestDispatcher("/WEB-INF/review/detail.jsp").forward(request, response);
	}

	private void doTotalList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		System.out.println(videoId);
		
		//영상 번호에 맞는 모든 리뷰 목록 불러오기
		List<Review> videoIdList = service.getList(videoId);
		
		
		System.out.println(videoIdList);
		
		request.setAttribute("videoIdList", videoIdList);
		request.getRequestDispatcher("/WEB-INF/review/list.jsp").forward(request, response);
	}

	private void doWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewWriter = request.getParameter("reviewWriter");
		String reviewContent = request.getParameter("reviewContent");
		
		Review newReview = new Review();
		newReview.setReviewTitle(reviewTitle);
		newReview.setReviewWriter(reviewWriter);
		newReview.setReviewContent(reviewContent);
		newReview.setVideoId(videoId);
		
		System.out.println(newReview.toString());
		
		//리뷰 추가 서비스 호출
		if(service.writeReview(newReview)) {
			//리뷰 전체 목록 페이지로 이동
			List<Review> videoIdList = service.getList(videoId);
			request.setAttribute("videoIdList", videoIdList);
			request.getRequestDispatcher("/WEB-INF/review/list.jsp").forward(request, response);
		}else {
			//알수 없는 오류 -> 리뷰전체목록 페이지로 이동
			request.setAttribute("errorMessage", "알 수 없는 오류. 다시 시도해주세요.");
			List<Review> videoIdList = service.getList(videoId);
			request.setAttribute("videoIdList", videoIdList);
		}
	}

	private void doWriteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loggedInUser");
		int videoId = Integer.parseInt(request.getParameter("videoId"));
		System.out.println(videoId);
		
		if(user!=null) {
			//작성페이지로 이동
			request.getRequestDispatcher("/WEB-INF/review/writeform.jsp").forward(request, response);
		}else {
			//리뷰작성불가 -> 리뷰 목록 페이지로 이동
			session.setAttribute("errorMessage", "로그인한 회원만 작성가능합니다.");
			//영상 번호에 맞는 모든 리뷰 목록 불러오기
			response.sendRedirect("review?act=totallist&videoId=" + videoId);
		}
		
	}
	

}
