package com.example.logistics.domain;

import lombok.Data;

@Data
public class Customer {
    private String customerId;
    private String nickname;
    private String account;
    private String pwd;
    private String email;
}
