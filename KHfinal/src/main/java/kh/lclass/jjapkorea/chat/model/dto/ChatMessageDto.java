package kh.lclass.jjapkorea.chat.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Component
//@Getter
//@Setter
public class ChatMessageDto {

    private String roomId;
    private String writer;
    private String message;
}
