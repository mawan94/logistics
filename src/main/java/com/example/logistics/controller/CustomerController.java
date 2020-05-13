package com.example.logistics.controller;

import com.example.logistics.domain.Customer;
import com.example.logistics.dto.LoginDTO;
import com.example.logistics.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CustomerController {
    private final CustomerService customerService;

    @PostMapping("/api/vi/customers")
    public ResponseEntity<Boolean> insert(@RequestBody Customer customer) {
        return ResponseEntity.ok(customerService.insert(customer));
    }

    @PostMapping("/api/vi/customers/{id}")
    public ResponseEntity<Customer> updateById(@PathVariable Integer id, @RequestBody Customer customer) {
        customer.setId(id);
        return ResponseEntity.ok(customerService.updateById(customer));
    }

    @GetMapping("/api/vi/customers")
    public ResponseEntity<List<Customer>> selectCustomers(@RequestParam("type") Integer type) {
        return ResponseEntity.ok(customerService.selectCustomers(type));
    }

    @PostMapping("/api/vi/customers/login")
    public ResponseEntity<Boolean> login(@RequestBody LoginDTO loginDTO) {
        return ResponseEntity.ok(customerService.login(loginDTO));
    }
}
