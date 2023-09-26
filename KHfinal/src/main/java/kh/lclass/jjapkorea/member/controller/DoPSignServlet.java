//package kh.lclass.jjapkorea.member.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import kh.lclass.jjapkorea.member.model.service.MemberServiceImpl;
//import kh.lclass.jjapkorea.member.model.vo.MemberVo;
//import kh.lclass.jjapkorea.member.model.vo.PersonVo;
//
//@WebServlet("/psignup.do")
//public class DoPSignServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//	}
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String mid = request.getParameter("idcheck");
//		String mpw = request.getParameter("M_Pwd");
//		MemberVo vo = new MemberVo(mid, mpw);
//		MemberServiceImpl service = new MemberServiceImpl();
//		service.pSignup(vo);
//		
//		String pname = request.getParameter("M_Name");
//		String pemail = request.getParameter("M_Email");
//		String pphone = request.getParameter("M_Phone");
//		PersonVo vo2 = new PersonVo(mid, pname, pemail, pphone);
//		int result = service.personSignup(vo2);
//		if(result < 1) {
//			System.out.println("회원가입 실패");
//			service.delete(mid);
//			response.sendRedirect(request.getContextPath()+"/psignup");
//		} else {
//			System.out.println("회원가입 성공");
//			response.sendRedirect(request.getContextPath()+"/index");
//		}
//	}
//
//}
