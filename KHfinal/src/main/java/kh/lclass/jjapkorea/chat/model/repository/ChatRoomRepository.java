package kh.lclass.jjapkorea.chat.model.repository;

import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import org.springframework.stereotype.Repository;


import javax.annotation.PostConstruct;
import java.util.*;
import java.util.stream.Stream;

@Repository
public class ChatRoomRepository {

    //private Map<String, ChatRoomDto> chatRoomDtoMap;
	//session ~~~~
	
	
//    @PostConstruct
//    private void init(){
//        chatRoomDtoMap = new LinkedHashMap<>();
//    }

	
	
	
	
    public List<ChatRoomDto> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
//        List<ChatRoomDto> result = new ArrayList<>(chatRoomDtoMap.values()); //맵퍼 session.selectlist
//        Collections.reverse(result);
//        return result;
    	return null;
    }

    public ChatRoomDto findRoomById(String id){
//        return chatRoomDtoMap.get(id); //session.selectone
    	return null;
    }

    public ChatRoomDto createChatRoomDto(String name){
        ChatRoomDto room = ChatRoomDto.create(name);
//        chatRoomDtoMap.put(room.getRoomId(), room);  //session.insert 

        return room;
    }
    //chat content db
}