package com.example.logistics.service;

import com.example.logistics.dao.OrderDao;
import com.example.logistics.dto.OrderDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderDao orderDao;

    public Page<OrderDTO> page(Pageable pageable) {
        return orderDao.page(pageable);
    }
}
