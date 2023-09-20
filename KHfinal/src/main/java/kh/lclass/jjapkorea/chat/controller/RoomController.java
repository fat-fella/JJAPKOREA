package kh.lclass.jjapkorea.chat.controller;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;
import kh.lclass.jjapkorea.chat.model.service.ChatRoomService;

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
    @PostMapping("/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){

        log.info("# Create Chat Room , name: " + name);
        rttr.addFlashAttribute("roomName", chatRoomService.createChatRoomDto(name));
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
}