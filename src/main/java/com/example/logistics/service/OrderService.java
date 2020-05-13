package com.example.logistics.service;

import com.example.logistics.dao.OrderDao;
import com.example.logistics.dto.OrderBO;
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

    public Boolean insert(OrderBO bo) {
        return orderDao.insert(bo);
    }

    public Boolean updateById(OrderDTO orderDTO) {
        return orderDao.updateById(orderDTO);
    }

    public OrderDTO selectById(String id) {
        return orderDao.selectById(id);
    }
}
