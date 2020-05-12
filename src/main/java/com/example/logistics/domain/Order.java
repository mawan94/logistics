package com.example.logistics.domain;

import lombok.Data;

@Data
public class Order {
    private String orderId;
    private String customerId;
    private String staffId;
    private int status;
}
