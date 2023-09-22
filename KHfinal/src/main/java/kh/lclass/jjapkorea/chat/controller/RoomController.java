package kh.lclass.jjapkorea.chat.controller;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import kh.lclass.jjapkorea.chat.model.dto.ChatMessageDto;
import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;
import kh.lclass.jjapkorea.chat.model.service.ChatRoomService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequiredArgsConstructor
@RequestMapping()
@Slf4j
public class RoomController {

	@Autowired
    private ChatRoomService chatRoomService;
	
    //채팅방 목록 조회
    @GetMapping("/rooms")
    public ModelAndView rooms(ModelAndView mv) throws Exception{

        log.info("# All Chat Rooms");

        mv.addObject("list", chatRoomService.findAllRooms());
        mv.setViewName("chat/rooms");

        return mv;
    }

    //채팅방 개설
//    @PostMapping("/room")
//    public String create(@RequestParam String name, RedirectAttributes rttr){
//
//        log.info("# Create Chat Room , name: " + name);
//        rttr.addFlashAttribute("roomName", chatRoomService.createChatRoomDto(name));
//        return "redirect:/rooms";
//    }
    @PostMapping("/room")
    public String create(@RequestParam String name, @RequestParam String writer, RedirectAttributes rttr) {
        log.info("# Create Chat Room, name: " + name + ", writer: " + writer);
        chatRoomService.createChatRoomDto(name, writer); // 방 생성 및 DB에 저장
        rttr.addFlashAttribute("roomName", name);
        return "redirect:/rooms";
    }


    //채팅방 조회
    @GetMapping("/room")
    public ModelAndView getRoom(String roomId, Model model, ModelAndView mv){

        log.info("# get Chat Room, roomID : " + roomId);

        model.addAttribute("room", chatRoomService.findRoomById(roomId));
        mv.setViewName("chat/room");
        
        return mv;
    }
    
//    @PostMapping("/insertChat")
//    public String chat(ChatMessageDto messageDto) {
//    	try {
//    		chatRoomService.insertChatMessage(messageDto);
//    		return "success"; // 성공한 경우 응답을 보냄
//    	} catch(Exception e) {
//    		e.printStackTrace();
//    		return "error"; // 실패한 경우 응답을 보냄
//    	}
//    }
}