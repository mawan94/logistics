package com.example.logistics.dao;

import com.example.logistics.dto.OrderDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class OrderDao {
    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private static final String SQL = "select o.id       as orderId," +
            "       c.nickname as customerName," +
            "       c.email    as customerEmail," +
            "       s.account  as deliveryPerson," +
            "       o.status   as orderStatus," +
            "       f.rate," +
            "       f.remark ," +
            "       c.id as customerId ," +
            "       c.nickname " +
            "from `order` o " +
            "         left join customer c on o.customer_id = c.id" +
            "         left join feedback f on c.id = f.customer_id" +
            "         left join staff s on f.staff_id = s.id" +
            " order by o.id desc";

    private static final String COUNT_SQL = "select count(1)" +
            "from `order` o" +
            "         left join customer c on o.customer_id = c.id" +
            "         left join feedback f on c.id = f.customer_id" +
            "         left join staff s on f.staff_id = s.id";

    public Page<OrderDTO> page(Pageable pageable) {
        List<OrderDTO> data = namedParameterJdbcTemplate.query(SQL + " limit :offset, :pageSize", new BeanPropertySqlParameterSource(pageable),
                new BeanPropertyRowMapper<>(OrderDTO.class));
        long total = namedParameterJdbcTemplate.queryForObject(COUNT_SQL, Collections.emptyMap(), Long.class);
        return new PageImpl<>(data, pageable, total);
    }
}
