package kh.lclass.jjapkorea.chat.controller;

import lombok.RequiredArgsConstructor;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.lclass.jjapkorea.chat.model.dto.ChatMessageDto;
import kh.lclass.jjapkorea.chat.model.repository.ChatRoomRepository;

@Controller
@RequiredArgsConstructor
public class StompChatController {

    private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달
    private final ChatRoomRepository chatRoomRepository;
    Principal principal;
//    String participant= (String)principal.getName();


    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessageDto message){
    	String participant=(String)principal.getName();
    	System.out.println(participant + " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        message.setMessage(message.getWriter()/*participant*/ + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessageDto message){

    	chatRoomRepository.insertChatMessage(message); //db저장

        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
    
    
}