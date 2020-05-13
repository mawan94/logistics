package com.example.logistics.controller;

import com.example.logistics.dto.OrderBO;
import com.example.logistics.dto.OrderDTO;
import com.example.logistics.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;

    @GetMapping("/api/v1/orders/page")
    public ResponseEntity<Page<OrderDTO>> page(Pageable pageable) {
        return ResponseEntity.ok(orderService.page(pageable));
    }

    @PostMapping("/api/v1/orders")
    public ResponseEntity<Boolean> insert(@RequestBody OrderBO bo) {
        return ResponseEntity.ok(orderService.insert(bo));
    }
}
