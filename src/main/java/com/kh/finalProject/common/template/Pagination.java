package com.kh.finalProject.common.template;

import com.kh.finalProject.common.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int totalRecord, int nowPage, int numPerPage, int pagePerBlock) {
		int totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		int startPage = (nowPage-1) / pagePerBlock * pagePerBlock + 1;
		int endPage = startPage+pagePerBlock-1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
//		PageInfo pi = new PageInfo(totalRecord, nowPage, numPerPage, pagePerBlock, totalPage, startPage, endPage);
//		return pi;
		
		return new PageInfo(totalRecord, nowPage, numPerPage, pagePerBlock, totalPage, startPage, endPage);
	}
}
