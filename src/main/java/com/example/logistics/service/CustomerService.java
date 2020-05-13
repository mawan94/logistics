package com.example.logistics.service;

import com.example.logistics.dao.CustomerDao;
import com.example.logistics.domain.Customer;
import com.example.logistics.dto.LoginDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    public List<Customer> selectCustomers(Integer type) {
        return customerDao.selectCustomers(type);
    }

    public Boolean login(LoginDTO loginDTO) {
        return customerDao.login(loginDTO);
    }
}
