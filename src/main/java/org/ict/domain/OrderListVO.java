package org.ict.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderListVO {
    private String orderNumber;
    private int mno;
    private String name;
    private String postcode;
    private String addr1;
    private String addr2;
    private String tel1;
    private String tel2;
    private String tel3;
    private int total;
    private String ship;
    private Date orderdate;
    
    private List<OrderDetailVO> orderDetail;
}