package com.example.logistics.domain;

import lombok.Data;

@Data
public class Order {
    private String id;
    private String recipientId;
    private String customerId;
    private String staffId;
    private int status;
    private String recipientAddress;
    private String recipientPhoneNumber;
    private String courierFee;
}
