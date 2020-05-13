package com.example.logistics.service;

import com.example.logistics.dao.CustomerDao;
import com.example.logistics.domain.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustomerService {
    @Resource
    CustomerDao customerDao;

    public Boolean insert(Customer customer) {
        return customerDao.insert(customer);
    }

    public Customer updateById(Customer customer) {
        return customerDao.updateById(customer);
    }
}
