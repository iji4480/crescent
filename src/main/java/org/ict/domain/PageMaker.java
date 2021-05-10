package org.ict.domain;

import lombok.Data;

@Data
public class PageMaker {
	private int totalPage;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPage;
	
	private Criteria cri;
	
	public void calcData() {
		this.displayPage = 10;
		
		this.endPage = (int)(Math.ceil(cri.getPage() / (double) displayPage) * displayPage);
		
		this.startPage = (endPage - displayPage) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalPage / (double)cri.getNumber()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getNumber() >= totalPage ? false : true;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		
		calcData();
	}
}
