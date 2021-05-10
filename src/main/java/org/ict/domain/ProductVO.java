package org.ict.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int pno;
	private String pname;
	private int price;
	private int pcnt;
	private int salescnt;
	private String pimg;
	private String pdimg;
}