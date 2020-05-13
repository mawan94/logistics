package com.example.logistics.dto;


import lombok.Data;

@Data
public class OrderBO {
    private String sender;
    private String recipient;
    private String recipientPhone;
    private String recipientAddress;
    private String courierFee;
    private Integer status;
    private String deliveryPerson;
}
