package kh.lclass.jjapkorea.board.controller;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.ui.Model;

import kh.lclass.jjapkorea.admin.model.dto.DeclarationDto;
import kh.lclass.jjapkorea.admin.model.service.AdminService;
import kh.lclass.jjapkorea.board.model.dto.BoardDto;
import kh.lclass.jjapkorea.board.model.dto.BoardParam;
import kh.lclass.jjapkorea.board.model.dto.Criteria;
import kh.lclass.jjapkorea.board.model.dto.PageMakerDto;
import kh.lclass.jjapkorea.board.model.service.BoardService;
import kh.lclass.jjapkorea.board.model.service.LikeService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private LikeService likeService;
	@Autowired private AdminService adminService;
	
	@GetMapping("/map")
	public String map() {
		return "board/map";
	}
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv
						, Criteria cri
						, BoardParam param
						, Principal principal ) throws Exception{
		
	    String memberid = null;
	    if (principal != null) {
	    	memberid = principal.getName();
	    }
		/* int readCount = boardService.boardReadCnt(param); */
		int total = boardService.getTotal(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		mv.addObject("memberid", memberid);
		mv.addObject("boardList", boardService.getListPage(cri));
		/* mv.addObject("readCount", readCount); */
		mv.addObject("pageMaker", pageMake);
		mv.addObject("total", total);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, int bno, Principal principal) throws Exception{
	    String memberid = null;
	    if (principal != null) {
	    	memberid = principal.getName();
	    }
	    mv.addObject("memberid", memberid);
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
	public Integer insertDo(BoardDto dto, Principal principal) {
		String member = principal.getName();
		dto.setMid(member);
	    Integer result;
	    try {
	        result = boardService.insert(dto);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	result = -1;
	    }
	    return result;
	}
	
	@GetMapping("/readcnt")
	@ResponseBody 
	public Integer readcnt(Model model, BoardParam param) throws Exception{ 
		return boardService.boardReadCnt(param);
	 }
	
	@GetMapping("/readcntView")
	public String readcntView(Model model, BoardParam param) throws Exception {
	    Integer readCount = boardService.boardReadCnt(param);
	    model.addAttribute("readcnt", readCount);
	    return "board/list"; // 뷰 페이지 이름 반환
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
// --------------- LIKE ---------------	
	@ResponseBody
	@RequestMapping(value = "/updateLike" , method = RequestMethod.POST)
	public int updateLike(Model model, int bno, String mid)throws Exception{
			
			int likeCheck = likeService.likeCheck(bno, mid);
			if(likeCheck == 0) {
				//좋아요 처음누름
				likeService.insertLike(bno, mid); //like테이블 삽입
				boardService.totalLike(bno);
				likeService.updateLikeCheck(bno, mid);//like테이블 구분자 1
			}else if(likeCheck == 1) {
				likeService.updateLikeCheckCancel(bno, mid); //like테이블 구분자0
				boardService.totalLikeCancel(bno);
				likeService.deleteLike(bno, mid); //like테이블 삭제
			}
			return likeCheck;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getLikeStatus", method = RequestMethod.GET)
	public int getLikeStatus(int bno, String mid) throws Exception {
	    int likeCheck = likeService.likeCheck(bno, mid);
	    return likeCheck;
	}
	
// --------------- 이미지 업로드 ---------------
    @RequestMapping(value="/fileupload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
    		HttpServletResponse response, MultipartHttpServletRequest multiFile
    		, @RequestParam MultipartFile upload) throws Exception{
	// 랜덤 문자 생성
    	UUID uid = UUID.randomUUID();
    	OutputStream out = null;
    	PrintWriter printWriter = null;
	//인코딩
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	try{
		//파일 이름 가져오기
    		String fileName = upload.getOriginalFilename();
    		byte[] bytes = upload.getBytes();
    		
		//이미지 경로 생성
    		String path = "C:\\WorkSpace\\GitHub\\JJAPKOREA\\KHfinal\\src\\main\\webapp\\resources\\images\\talk";	// 이미지 경로 설정(폴더 자동 생성)
    		String ckUploadPath = path + uid + "_" + fileName;
    		File folder = new File(path);
    		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
		//해당 디렉토리 확인
    		if(!folder.exists()){
    			try{
    				folder.mkdirs(); // 폴더 생성
    		}catch(Exception e){
    			e.getStackTrace();
    		}
    	}
    	out = new FileOutputStream(new File(ckUploadPath));
    	out.write(bytes);
    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
    	
    	String callback = request.getParameter("CKEditorFuncNum");
    	printWriter = response.getWriter();
    	String fileUrl = "/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면
    	
	// 업로드시 메시지 출력
    	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
    	printWriter.flush();
    	
    	}catch(IOException e){
    		e.printStackTrace();
    	} finally {
    		try {
    		if(out != null) { out.close(); }
    		if(printWriter != null) { printWriter.close(); }
    	} catch(IOException e) { e.printStackTrace(); }
    	}
    	return;
    }
// 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value="/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
    		, @RequestParam(value="fileName") String fileName
    		, HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
    	
	//서버에 저장된 이미지 경로
		String path = "C:\\workspace\\github\\JJAPKOREA\\KHfinal\\src\\main\\webapp\\resources\\images\\talk";	// 이미지 경로 설정(폴더 자동 생성)
		System.out.println("path:"+path);
    	String sDirPath = path + uid + "_" + fileName;
    	
    	File imgFile = new File(sDirPath);
    	
	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
    	if(imgFile.isFile()){
    		byte[] buf = new byte[1024];
    		int readByte = 0;
    		int length = 0;
    		byte[] imgBuf = null;
    		
    		FileInputStream fileInputStream = null;
    		ByteArrayOutputStream outputStream = null;
    		ServletOutputStream out = null;
    		
    		try{
    			fileInputStream = new FileInputStream(imgFile);
    			outputStream = new ByteArrayOutputStream();
    			out = response.getOutputStream();
    			
    			while((readByte = fileInputStream.read(buf)) != -1){
    				outputStream.write(buf, 0, readByte); 
    			}
    			
    			imgBuf = outputStream.toByteArray();
    			length = imgBuf.length;
    			out.write(imgBuf, 0, length);
    			out.flush();
    			
    		}catch(IOException e){
    			e.printStackTrace();
    		}finally {
    			outputStream.close();
    			fileInputStream.close();
    			out.close();
			}
		}
	}

//	@PostMapping("/fileupload.do")
//	@ResponseBody
//	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
//			MultipartHttpServletRequest multiFile) throws IOException {
//
//		// Json 객체 생성
//		JsonObject json = new JsonObject();
//		// Json 객체를 출력하기 위해 PrintWriter 생성
//		PrintWriter printWriter = null;
//		OutputStream out = null;
//		// 파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
//		MultipartFile file = multiFile.getFile("upload");
//		// 파일이 비어있지 않고(비어 있다면 null 반환)
//		if (file != null) {
//			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
//			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
//				if (file.getContentType().toLowerCase().startsWith("image/")) {
//
//					try {
//						// 파일 이름 설정
//						String fileName = file.getName();
//						// 바이트 타입설정
//						byte[] bytes;
//						// 파일을 바이트 타입으로 변경
//						bytes = file.getBytes();
//						// 파일이 실제로 저장되는 경로
//						String uploadPath = request.getServletContext().getRealPath("/resources/images/talk/");
//						// 저장되는 파일에 경로 설정
//						File uploadFile = new File(uploadPath);
//						if (!uploadFile.exists()) {
//							uploadFile.mkdirs();
//						}
//						// 파일이름을 랜덤하게 생성
//						fileName = UUID.randomUUID().toString();
//						// 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송
//						uploadPath = uploadPath + "/" + fileName;
//						out = new FileOutputStream(new File(uploadPath));
//						out.write(bytes);
//
//						// 클라이언트에 이벤트 추가
//						printWriter = response.getWriter();
//						response.setContentType("text/html");
//
//						// 파일이 연결되는 Url 주소 설정
//						String fileUrl = request.getContextPath() + "/resources/images/talk/" + fileName;
//
//						// 생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
//						json.addProperty("uploaded", 1);
//						json.addProperty("fileName", fileName);
//						json.addProperty("url", fileUrl);
//						printWriter.println(json);
//					} catch (IOException e) {
//						e.printStackTrace();
//					} finally {
//						if (out != null) {
//							out.close();
//						}
//						if (printWriter != null) {
//							printWriter.close();
//						}
//					}
//				}
//			}
//		}
//		return null;
//	}
    @PostMapping("/declarationWait")
    @ResponseBody
    public ResponseEntity<String> handleDeclaration(Principal principal, @RequestBody DeclarationDto declarationDto) throws Exception {
    	if (principal != null) {
    		String mid = principal.getName();
    		declarationDto.setMid(mid);
    		if(!mid.equals(declarationDto.getRid())) {
        		if(adminService.reportsByUser(declarationDto) == null || adminService.reportsByUser(declarationDto).isEmpty()) {
        			adminService.reportBoard(declarationDto);
        			return new ResponseEntity<>("success", HttpStatus.OK);
        		} else {
            		return new ResponseEntity<>("fail", HttpStatus.OK);
        		}

    		} else {
    			return new ResponseEntity<>("failure", HttpStatus.OK);
    		}
    	} else {
    		return new ResponseEntity<>("Unauthorized: 로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
    	}
    }
}