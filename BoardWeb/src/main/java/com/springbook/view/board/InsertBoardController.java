package com.springbook.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InsertBoardController{
	@RequestMapping(value="/insertBoard.do")
	public void handleRequest(BoardVO vo) {
		System.out.println("글 등록 처리");
		
		BoardDAO boardDAO=new BoardDAO();
		boardDAO.insertBoard(vo);
		
		
		// 1. 사용자 입력 정보 추출
		// request.setCharacterEncoding("EUC-KR");
		/*String title = request.getParameter("title");
		String writter = request.getParameter("writter");
		String content = request.getParameter("content");*/
		
		// 2. DB 연동 처리
		/*BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWritter(writter);
		vo.setContent(content);
		
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.insertBoard(vo);*/
		
/*		// 3. 화면 네비게이션
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:getBoardList.do");
		return mav;*/
	}
}
