package com.example.logistics.controller;

import com.example.logistics.domain.Feedback;
import com.example.logistics.service.FeedBackService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class FeedbackController {
    private final FeedBackService feedBackService;

    @PostMapping("/api/v1/feedback/{orderId}")
    public ResponseEntity<Boolean> updateByOrderId(@PathVariable String orderId, Feedback feedback) {
        feedback.setOrderId(orderId);
        return ResponseEntity.ok(feedBackService.updateByOrderId(feedback));
    }
}
