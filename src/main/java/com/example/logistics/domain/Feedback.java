package com.example.logistics.domain;

import lombok.Data;

@Data
public class Feedback {
    private String feedbackId;
    private int rate;
    private String orderId;
    private String staffId;
    private String customerId;
    private String remark;
}
