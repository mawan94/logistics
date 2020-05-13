package com.example.logistics.dao;

import com.example.logistics.dto.OrderBO;
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
            "       s.account  as account," +
            "       o.status   as orderStatus," +
            "       f.rate," +
            "       f.remark ," +
            "       c.id as customerId ," +
            "       c.nickname ," +
            "       o.recipient ," +
            "       o.recipient_address ," +
            "       o.recipient_phone ," +
            "       o.courier_fee ," +
            "       o.sender ," +
            "       o.delivery_person " +
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

    public Boolean insert(OrderBO bo) {
        StringBuilder sql = new StringBuilder("INSERT INTO `order` (customer_id, staff_id, status, recipient, recipient_address, recipient_phone, courier_fee, sender, delivery_person) VALUES ('2', '2',");
        sql.append(bo.getStatus()).append(", ");
        sql.append("'").append(bo.getRecipient()).append("'").append(", ");
        sql.append("'").append(bo.getRecipientAddress()).append("'").append(", ");
        sql.append("'").append(bo.getRecipientPhone()).append("'").append(", ");
        sql.append("'").append(bo.getCourierFee()).append("'").append(", ");
        sql.append("'").append(bo.getSender()).append("'").append(", ");
        sql.append("'").append(bo.getDeliveryPerson()).append("'").append(")");
        return namedParameterJdbcTemplate.update(sql.toString(), Collections.emptyMap()) >= 1;
    }
}
