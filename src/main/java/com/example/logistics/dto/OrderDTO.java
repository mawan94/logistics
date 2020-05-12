package com.example.logistics.dto;


import lombok.Data;

@Data
public class OrderDTO {
    private String orderId;
    private String customerName;
    private String customerEmail;
    private String deliveryPerson;
    private String orderStatus;
    private Integer rate;
    private String remark;
}
