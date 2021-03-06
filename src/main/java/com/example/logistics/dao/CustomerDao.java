package com.example.logistics.dao;

import com.example.logistics.domain.Customer;
import com.example.logistics.dto.LoginDTO;
import com.example.logistics.enums.CustomerType;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class CustomerDao {
    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Boolean insert(Customer customer) {
        int update = namedParameterJdbcTemplate.update("INSERT INTO customer(nickname, account, pwd, email, type) " +
                "VALUES(:nickname, :account, :pwd, :email, :type)", new BeanPropertySqlParameterSource(customer));
        return update >= 1;
    }

    public Customer updateById(Customer customer) {
        StringBuilder sql = new StringBuilder("UPDATE customer SET ");
        if (customer.getAccount() != null) {
            sql.append(" account = ").append("'").append(customer.getAccount()).append("'").append(",");
        }
        if (customer.getEmail() != null) {
            sql.append(" email = ").append("'").append(customer.getEmail()).append("'").append(",");
        }
        if (customer.getNickname() != null) {
            sql.append(" nickname = ").append("'").append(customer.getNickname()).append("'").append(",");
        }
        if (customer.getPwd() != null) {
            sql.append(" pwd = ").append("'").append(customer.getPwd()).append("'").append(",");
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

    public List<Customer> selectCustomers(Integer type) {
        String sql = "SELECT * FROM customer ";
        if (type == CustomerType.ADMIN.getCode()) {
            sql = sql + " WHERE type = " + type;
        } else if (type == CustomerType.CUSTOMER.getCode()) {
            sql = sql + " WHERE type = " + type;
        }
        return namedParameterJdbcTemplate.query(sql, Collections.emptyMap(),
                new BeanPropertyRowMapper<>(Customer.class));
    }

    public Boolean login(LoginDTO loginDTO) {
        Integer cnt = namedParameterJdbcTemplate.queryForObject(
                String.format("SELECT COUNT(*) FROM customer WHERE account = '%s' AND pwd = '%s'",
                        loginDTO.getAccount(), loginDTO.getPwd()), Collections.emptyMap(),
                Integer.class);
        return cnt == 1;
    }
}
