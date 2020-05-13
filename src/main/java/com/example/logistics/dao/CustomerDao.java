package com.example.logistics.dao;

import com.example.logistics.domain.Customer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

@Repository
public class CustomerDao {
    @Resource
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Boolean insert(Customer customer) {
        int update = namedParameterJdbcTemplate.update("INSERT INTO customer(nickname, account, pwd, email, type) " +
                "VALUES(:nickname, :account, :pwd, :email, :type)", new BeanPropertySqlParameterSource(customer));
        return update >= 1;
    }

    public Customer updateById(Customer customer) {
        namedParameterJdbcTemplate.update("UPDATE customer " +
                "SET nickname=:nickname, account=:account, pwd=:pwd, email=:email, type=:type WHERE id=:id", new BeanPropertySqlParameterSource(customer));
        return customer;
    }
}
