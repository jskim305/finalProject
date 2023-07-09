package com.kh.finalProject.common.model.vo;

public class PageInfo {
	private int totalRecord;	// 총 게시글의 갯수  54
	private int nowPage;		// 현재 페이지 [1]  10
	private int numPerPage;		// 해당 페이지에 보여질 게시글의 갯수
	private int pagePerBlock;	// 하단에 보열질 페이징바의 갯수 [1][2][3] ... next
	
	private int totalPage;		// 전체페이지수      6
	private int startPage;		// 해당 페이지에 보여질 페이징바의 시작수  ...prev [2][3][4] ...next
	private int endPage;		// 해당 페이지에 보여질 페이징바의 끝수
	
	public PageInfo() {
	}

	public PageInfo(int totalRecord, int nowPage, int numPerPage, int pagePerBlock, int totalPage, int startPage,
			int endPage) {
		super();
		this.totalRecord = totalRecord;
		this.nowPage = nowPage;
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
		this.totalPage = totalPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [totalRecord=" + totalRecord + ", nowPage=" + nowPage + ", numPerPage=" + numPerPage
				+ ", pagePerBlock=" + pagePerBlock + ", totalPage=" + totalPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + "]";
	}
}
