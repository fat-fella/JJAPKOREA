package kh.lclass.jjapkorea.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.LikeDto;
import kh.lclass.jjapkorea.board.model.service.BoardService;
import kh.lclass.jjapkorea.board.model.service.LikeService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private LikeService likeService;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv) throws Exception{
		mv.addObject("boardList", boardService.selectList());
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, int bno) throws Exception{ //jsp에서 controller로 데이터 전달
		LikeDto dto = new LikeDto();
		dto.setBno(bno);
		dto.setMid("admin"); // set이면 저장되어있는 아이디 가져와야함.
		
		int like_no = 0;
		int check = likeService.likeCount(dto);
	
		if(check == 0) {
			likeService.likeInsert(dto);
		}else if(check == 1) {
			like_no = likeService.likeGet(dto);
		}
		mv.addObject("like_no", like_no);	
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
	public Integer insertDo(BoardDto dto) {
		dto.setMid("admin");
	    Integer result;
	    try {
	        result = boardService.insert(dto);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	result = -1;
	    }
	    return result;
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
}