package org.ict.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cno;
	private int mno;
	private int pno;
	private String pname;
	private String pimg;
	private int price;
	private int cnt;
	private int result;
	private int total;
}
