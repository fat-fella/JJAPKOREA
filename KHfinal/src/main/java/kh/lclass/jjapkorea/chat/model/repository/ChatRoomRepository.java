//package kh.lclass.jjapkorea.chat.model.repository;
//
//import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
//
//import org.springframework.stereotype.Repository;
//
//import javax.annotation.PostConstruct;
//import java.util.*;
//
//@Repository
//
//
//public class ChatRoomRepository {
//
//    private Map<String, ChatRoomDto> chatRoomDtoMap;
//
//    @PostConstruct
//    private void init(){
//        chatRoomDtoMap = new LinkedHashMap<>();
//    }
//
//	
//    public List<ChatRoomDto> findAllRooms(){
////        채팅방 생성 순서 최근 순으로 반환
//        List<ChatRoomDto> result = new ArrayList<>(chatRoomDtoMap.values()); //맵퍼 session.selectlist
//        Collections.reverse(result);
//        return result;
//    }
//
//	
//	
//	
//    public ChatRoomDto findRoomById(String id){
//        return chatRoomDtoMap.get(id); //session.selectone
//    }
//
//	
//    public ChatRoomDto createChatRoomDto(String name){
//        ChatRoomDto room = ChatRoomDto.create(name);
//        chatRoomDtoMap.put(room.getRoomId(), room);  //session.insert 
//        
//        return room;
//    }
//    
//}



package kh.lclass.jjapkorea.chat.model.repository;

import kh.lclass.jjapkorea.chat.model.dto.ChatMessageDto;
import kh.lclass.jjapkorea.chat.model.dto.ChatRoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;

import java.security.Principal;
import java.util.*;
import java.util.stream.Stream;

@Repository
public class ChatRoomRepository {

    @Autowired
    private SqlSession sqlSession;

    public String findRoom(String principal) {
    	return sqlSession.selectOne("chat.findRoom");
    }
    
    public List<ChatRoomDto> findAllRooms(String mid) {
        // MyBatis를 통해 오라클 데이터베이스에서 방 목록을 조회
    	return sqlSession.selectList("chat.findAllRooms", mid);        
    }

    public ChatRoomDto findRoomById(String id) {
        // MyBatis를 통해 오라클 데이터베이스에서 방을 조회
        return sqlSession.selectOne("chat.findRoomById", id);
    }

    public int createChatRoomDto(String name, String writer) {
        ChatRoomDto room = ChatRoomDto.create(name, writer);
        return  sqlSession.insert("chat.insert", room);
    }
    
    public int insertChatMessage(ChatMessageDto messageDto) {
        return sqlSession.insert("chat.insertMessage", messageDto);
    }
    
    public List<ChatMessageDto> showChat(String id) {
    	System.out.println("!!!!!!!!!!!!!!!!!!!!"+sqlSession.selectList("chat.showChat"));
    	return sqlSession.selectList("chat.showChat", id);
    }
}
