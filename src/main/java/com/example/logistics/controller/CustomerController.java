package com.example.logistics.controller;

import com.example.logistics.domain.Customer;
import com.example.logistics.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CustomerController {
    private final CustomerService customerService;

    @PostMapping("/api/vi/customers")
    public ResponseEntity<Boolean> insert(@RequestBody Customer customer) {
        return ResponseEntity.ok(customerService.insert(customer));
    }

    @PostMapping("/api/vi/customers/{customerId}")
    public ResponseEntity<Customer> updateById(@PathVariable String customerId, @RequestBody Customer customer) {
        return ResponseEntity.ok(customerService.updateById(customer));
    }
}
