package org.ict.domain;

import lombok.Data;

@Data
public class ReviewImageVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	
	private int rno;
}
