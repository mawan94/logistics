package com.example.logistics.dao;

import com.example.logistics.domain.Customer;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

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
        StringBuilder sql = new StringBuilder("UPDATE customer SET ");
        if (customer.getAccount() != null) {
            sql.append(" account = ").append(customer.getAccount()).append(",");
        }
        if (customer.getEmail() != null) {
            sql.append(" email = ").append(customer.getEmail()).append(",");
        }
        if (customer.getNickname() != null) {
            sql.append(" nickname = ").append(customer.getNickname()).append(",");
        }
        if (customer.getPwd() != null) {
            sql.append(" pwd = ").append(customer.getPwd()).append(",");
        }
        if (customer.getType() != null) {
            sql.append(" type = ").append(customer.getType()).append(",");
        }

        if (sql.lastIndexOf(",") == sql.length() - 1) {
            sql.setLength(sql.length() - 1);
        }

        if (customer.getId() != null) {
            sql.append(" WHERE id = ").append(customer.getId());
        }

        namedParameterJdbcTemplate.update(sql.toString(), Collections.emptyMap());
        return customer;
    }

    public List<Customer> selectCustomers() {
        return namedParameterJdbcTemplate.query("SELECT * FROM customer", Collections.emptyMap(),
                new BeanPropertyRowMapper<>(Customer.class));
    }
}
