package jjapkorea.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jjapkorea.Jobposting.model.dto.JobpostingDto;
import jjapkorea.Jobposting.model.service.JobpostingService;
import jjapkorea.worknetapi.WorknetApi;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WorknetApi worknetApi;
	
    public IndexServlet() {
        super();
        worknetApi = new WorknetApi();
        worknetApi.getJobPostings();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobpostingService service = new JobpostingService();
		List<JobpostingDto> list = service.list();
		/*
		 * //List<JobpostingDto> list = worknetApi.getJobPostings(); // WorknetApi를 통해
		 * DTO 리스트를 가져옴. int endIndex = Math.min(list.size(), 8); // 8개 요소 이하인 경우 끝 인덱스를
		 * 리스트 크기로 설정 List<JobpostingDto> firstEightItems = list.subList(0, endIndex);
		 * request.setAttribute("list", firstEightItems);
		 */
		int chunkSize = 8; // 묶을 요소 개수
		int totalItems = list.size();
		for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
		    int endIndex = Math.min(startIndex + chunkSize, totalItems);
		    List<JobpostingDto> subList = list.subList(startIndex, endIndex);
		    String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
		    request.setAttribute(attributeName, subList);
		}
		request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
	}

}
