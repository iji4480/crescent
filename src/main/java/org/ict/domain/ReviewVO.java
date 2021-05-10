package org.ict.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	private int rno;
	private String rtitle;
	private String rcontent;
	private int mno;
	private String mid;
	private int pno;
	private String pname;
	private String pimg;
	private Date rwritedate;
	private Date rupdatedate;
	
	private List<ReviewImageVO> imageList;
}