package kh.lclass.jjapkorea.board.controller;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.BoardParam;
import kh.lclass.jjapkorea.board.model.dto.Criteria;
import kh.lclass.jjapkorea.board.model.dto.PageMakerDto;
import kh.lclass.jjapkorea.board.model.service.BoardService;
import kh.lclass.jjapkorea.board.model.service.LikeService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private LikeService likeService;	
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv
						, Criteria cri
						, BoardParam param
						, Principal principal ) throws Exception{
		
		String member = principal.getName();
		int readCount = boardService.boardReadCnt(param);
		int total = boardService.getTotal(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		mv.addObject("member", member);
		mv.addObject("boardList", boardService.getListPage(cri));
		mv.addObject("readCount", readCount);
		mv.addObject("pageMaker", pageMake);
		mv.addObject("total", total);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, int bno) throws Exception{
		mv.addObject("bvo", boardService.selectOne(bno));
		mv.setViewName("board/get"); // http://localhost:8090/jjap/board/get?bno=3
		return mv;
	}

	
	@PostMapping("/delete")
	@ResponseBody
	public Integer delete(int bno) {
		Integer result = 0;
		try {
			result = boardService.delete(bno);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "board/insert";
	}
	@PostMapping("/insert")
	@ResponseBody
	public Integer insertDo(BoardDto dto, Principal principal) {
		String member = principal.getName();
		dto.setMid(member);
	    Integer result;
	    try {
	        result = boardService.insert(dto);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	result = -1;
	    }
	    return result;
	}
	
	@GetMapping("/readcnt")
	@ResponseBody public Integer readcnt(Model model, BoardParam param) throws Exception{ 
		return boardService.boardReadCnt(param);
	 }
	
	@GetMapping("/update")
	public String update(Model model, int bno) throws Exception{
		BoardDto dto = boardService.selectOne(bno); // 글 정보를 가져옴
        model.addAttribute("dto", dto);
	    return "board/update";
	}
	@PostMapping("/update")
	@ResponseBody
	public Integer updateDo(BoardDto dto){
		Integer result;
	    try {
	        result = boardService.update(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = -1;
	    }
	    return result;
	}
// --------------- LIKE ---------------	
	@ResponseBody
	@RequestMapping(value = "/updateLike" , method = RequestMethod.POST)
	public int updateLike(Model model, int bno, String mid)throws Exception{
			
			int likeCheck = likeService.likeCheck(bno, mid);
			if(likeCheck == 0) {
				//좋아요 처음누름
				likeService.insertLike(bno, mid); //like테이블 삽입
				boardService.totalLike(bno);
				likeService.updateLikeCheck(bno, mid);//like테이블 구분자 1
			}else if(likeCheck == 1) {
				likeService.updateLikeCheckCancel(bno, mid); //like테이블 구분자0
				boardService.totalLikeCancel(bno);
				likeService.deleteLike(bno, mid); //like테이블 삭제
			}
			return likeCheck;
	}
}