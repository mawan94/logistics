package com.example.logistics.domain;

import lombok.Data;

@Data
public class Feedback {
    private int id;
    private Integer rate;
    private String orderId;
    private String staffId;
    private String customerId;
    private String remark;
}
