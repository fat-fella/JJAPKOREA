package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class Pagination {
	private int totalItems; // 전체 항목 수
	private int currentPage; // 현재 페이지 번호
	private int itemsPerPage; // 페이지당 항목 수
	private int totalPages; // 전체 페이지 수

	public Pagination(int totalItems, int currentPage, int itemsPerPage) {
		if (totalItems <= 0) {
			this.totalPages = 1;
		} else {
			this.totalItems = totalItems;
			this.itemsPerPage = itemsPerPage;
			this.totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
		}

		// 현재 페이지 번호가 유효한 범위 내에 있는지 확인하고 조정
		if (currentPage < 1) {
			this.currentPage = 1;
		} else if (currentPage > totalPages) {
			this.currentPage = totalPages;
		} else {
			this.currentPage = currentPage;
		}
	}
}
