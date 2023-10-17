package kh.lclass.jjapkorea.chat.controller;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import kh.lclass.jjapkorea.chat.model.dto.ChatMessageDto;
import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;
import kh.lclass.jjapkorea.chat.model.service.ChatRoomService;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authorization.AuthorityAuthorizationDecision;
import org.springframework.security.core.Authentication;
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
    public ModelAndView rooms(ModelAndView mv
    		, Principal principal
    		) throws Exception{
    	String mid = (String) principal.getName();
        log.info("# All Chat Rooms");
// authority admin
        if(mid.equals("admin")) {
        mv.addObject("list", chatRoomService.findAllRooms());
        }
        else {
// authority  person
        mv.addObject("mylist", chatRoomService.findRoom(mid));
        }
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
        
        model.addAttribute("showChat", chatRoomService.showChat(roomId));
        System.out.println("~!@!~!@!~@~@!~@!~Q@~!@~!@!~@"+roomId);
        
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