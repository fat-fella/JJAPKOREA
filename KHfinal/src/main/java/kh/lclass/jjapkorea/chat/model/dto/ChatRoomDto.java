package kh.lclass.jjapkorea.chat.model.dto;



import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
@Component
@Getter
@Setter
public class ChatRoomDto {

    private String roomId;
    private String name;
    private String writer;
    private List<WebSocketSession> sessions = new ArrayList<>();
    
    
    public static ChatRoomDto create(String roomId, String name, String writer){
        ChatRoomDto room = new ChatRoomDto();

        room.roomId = UUID.randomUUID().toString();
        room.name = name;
        room.writer = writer;
        return room;
    }
}

//import lombok.Getter;
//import lombok.Setter;
//import org.springframework.web.socket.WebSocketSession;
//
//import java.util.HashSet;
//import java.util.Set;
//import java.util.UUID;
//
//@Getter
//@Setter
//public class ChatRoomDto {
//
//    private String roomId;
//    private String name;
//    private Set<WebSocketSession> sessions = new HashSet<>();
//    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션
//
//    public static ChatRoomDto create(String name){
//        ChatRoomDto room = new ChatRoomDto();
//
//        room.roomId = UUID.randomUUID().toString();
//        room.name = name;
//        return room;
//    }
//}