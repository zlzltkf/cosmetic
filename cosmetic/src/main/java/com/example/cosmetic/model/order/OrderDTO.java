package com.example.cosmetic.model.order;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {
	
    private int orderid;
    private String userid;
    
    private String orderItemId;
//    private String p_ids;
//    private String amounts;
    
//    private String orderStatus;
    private Date orderDate;
    
    private int price;
    private int deliverCost;
    private int totalPrice;
    
    private String method;
//    private String cardNumber;
    
    private String username;
    private String zipcode;
    private String address1;
    private String address2;
    private String tel;
    
//    private String cancelReason;
    private int userPoint;
	
}
