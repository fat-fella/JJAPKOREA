package kh.lclass.jjapkorea.board.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.LikeDto;
import kh.lclass.jjapkorea.board.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv) throws Exception{
		mv.addObject("boardList", boardService.selectList());
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
	
// 게시글 좋아요 및 취소
	@PostMapping("/doLike")
	@ResponseBody
	public HashMap<String, Object> doLike(@RequestBody LikeDto lDto) throws Exception{
	    HashMap<String, Object> data = new HashMap<>();
	    int myLikeCount = 0;
	    try {
	        myLikeCount = boardService.getMyLikeCount(lDto);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if(myLikeCount > 0) {
	        // 이미 좋아요를 눌렀으므로 좋아요를 취소합니다.
	        boardService.deleteLike(lDto);
	        data.put("status", "unlike");
	    } else {
	        // 좋아요를 누르지 않았으므로 좋아요를 추가합니다.
	        boardService.doLike(lDto);
	        data.put("status", "like");
	    }
	    
	    // 좋아요 수 업데이트
	    int totalLikeCount = boardService.getTotalLikeCount(lDto.getBno());
	    data.put("totalLikeCount", totalLikeCount);
	    
	    data.put("result", "success");
	    return data;
	}
	
// 게시글 좋아요 상태
	@PostMapping("/getMyLikeStatus")
	public HashMap<String, Object> getMyLikeStatus(LikeDto lDto) throws Exception{
		HashMap<String, Object> data = new HashMap<>();
		lDto.setMid("admin");

		int myLikeCount = boardService.getMyLikeCount(lDto);

		data.put("result", "success");
		
		if(myLikeCount > 0) {
			data.put("status", "like");
		}else {
			data.put("status", "unlike");
		}
		return data;
	}

// 게시글 좋아요 총 갯수
	@PostMapping("/getTotalLikeCount")
	public HashMap<String, Object> getTotalLikeCount(int bno) throws Exception{
		HashMap<String, Object> data = new HashMap<>();
		int totalLikeCount = boardService.getTotalLikeCount(bno);
		data.put("totalLikeCount", totalLikeCount);
		return data;
	}
}