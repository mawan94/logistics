package com.example.logistics.domain;

import lombok.Data;

@Data
public class Order {
    private String id;
    private String recipient;// 收件人名称
    private String customerId;
    private String staffId;
    private int status;
    private String recipientAddress;
    private String recipientPhone;
    private String courierFee;
}
