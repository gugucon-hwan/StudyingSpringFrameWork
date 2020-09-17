package com.springbook.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
@SessionAttributes("board")
public class BoardController {
	//�� ���
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.insertBoard(vo);
		return "getBoardList.do";
	}
	
	//�� ����
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, BoardDAO boardDAO) {
		
		System.out.println("��ȣ : "+vo.getSeq());
		System.out.println("���� : "+vo.getTitle());
		System.out.println("�ۼ��� : "+vo.getWritter());
		System.out.println("���� : "+vo.getContent());
		System.out.println("����� : "+vo.getRegDate());
		System.out.println("��ȸ�� : "+vo.getCnt());
		boardDAO.updateBoard(vo);
		return "getBoardList.do";
	}
		
	//�� ����
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.deleteBoard(vo);
		return "getBoardList.do";
	}
	
	//�� �� ��ȸ 
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		model.addAttribute("board",boardDAO.getBoard(vo));//Model ���� ����
		return "getBoard.jsp"; //View�̸� ����
	}
	//�˻� ���� ��� ����
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String,String> conditionMap=new HashMap<String, String>();
		conditionMap.put("����", "TITLE");
		conditionMap.put("����", "CONTENT");
		return conditionMap;		
	}
	
	//�� ��� �˻�
	@RequestMapping("/getBoardList.do")
	public String getBoardList(@RequestParam(value="searchCondition",defaultValue = "TITLE", 	required = false) String condition,
													@RequestParam(value="searchKeyword", defaultValue = "", required = false) String keyword,
													BoardVO vo, BoardDAO boardDAO, Model model) 
	{
		System.out.println("�˻� ���� : "+condition);
		System.out.println("�˻� �ܾ� : "+keyword);
		//Model ���� ����
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		return "getBoardList.jsp";//View�̸� ����
	}
}	
