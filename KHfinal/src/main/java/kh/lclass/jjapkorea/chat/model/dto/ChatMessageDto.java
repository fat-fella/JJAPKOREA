package kh.lclass.jjapkorea.chat.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
//@Getter
//@Setter
public class ChatMessageDto {
    private String roomId;
    private String writer;
    private String message;
    private String timestamp;
    private String participant;
}
