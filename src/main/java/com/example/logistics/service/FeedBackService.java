package com.example.logistics.service;

import com.example.logistics.dao.FeedBackDao;
import com.example.logistics.domain.Feedback;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FeedBackService {
    private final FeedBackDao feedBackDao;

    public Boolean updateByOrderId(Feedback feedback) {
        return feedBackDao.updateByOrderId(feedback);
    }
}
