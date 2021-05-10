package org.ict.domain;

import lombok.Data;

@Data
public class Criteria {
	private int page;
	private int number;
	
	public Criteria() {
		this.page = 1;
		this.number = 10;
	}
	
	public int getStart() {
		return (this.page - 1) * this.number;
	}
}
