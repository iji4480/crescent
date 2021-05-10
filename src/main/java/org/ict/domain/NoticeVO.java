package org.ict.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int nno;
	private String ntitle;
	private String ncontent;
	private Date nwritedate;
}
