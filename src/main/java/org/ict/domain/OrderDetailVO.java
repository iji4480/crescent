package org.ict.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int ono;
	private String orderNumber;
	private int pno;
	private String pname;
	private String pimg;
	private int ocnt;
	private int result;
}
