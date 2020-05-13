package com.example.logistics.domain;

import lombok.Data;

@Data
public class Customer {
    private Integer id;
    private String nickname;
    private String account;
    private String pwd;
    private String email;
    private Integer type;
}
