package com.example.logistics.controller;

import com.example.logistics.domain.Customer;
import com.example.logistics.service.CustomerService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/api/vi")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @PostMapping("/customers")
    @ResponseBody
    public ResponseEntity<Boolean> insert(@RequestBody Customer customer) {
        return ResponseEntity.ok(customerService.insert(customer));
    }
}
