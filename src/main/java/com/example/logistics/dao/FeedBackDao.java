package com.example.logistics.dao;

import com.example.logistics.domain.Feedback;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class FeedBackDao {
    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Boolean updateByOrderId(Feedback feedback) {
        StringBuilder sql = new StringBuilder("UPDATE feedback SET ");
        if (Objects.nonNull(feedback.getRate())) {
            sql.append(" rate = ").append(feedback.getRate()).append(",");
        }

        if (!StringUtils.isEmpty(feedback.getRemark())) {
            sql.append(" remark = ").append("'").append(feedback.getRemark()).append("'").append(",");
        }

        if (sql.lastIndexOf(",") == sql.length() - 1) {
            sql.setLength(sql.length() - 1);
        }

        if (feedback.getOrderId() != null) {
            sql.append(" WHERE order_id = ").append(feedback.getOrderId());
        }

        return namedParameterJdbcTemplate.update(sql.toString(), Collections.emptyMap()) >= 1;
    }
}
