package com.example.logistics.controller;

import com.example.logistics.domain.OrderPDFView;
import com.example.logistics.dto.OrderDTO;
import com.example.logistics.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class PDFController extends AbstractController {
    private final OrderService orderService;

    @Override
    @GetMapping("/api/orders/one/pdf")
    public ModelAndView handleRequestInternal(HttpServletRequest request,
                                              HttpServletResponse response) throws Exception {
        String orderId = request.getParameter("orderId");
        OrderDTO orderDTO = orderService.selectById(orderId);

        List<String> orderData = new ArrayList<>();
        orderData.add(orderDTO.getOrderId());
        orderData.add(orderDTO.getSender());
        orderData.add(orderDTO.getDeliveryPerson());
        orderData.add(orderDTO.getRecipient());
        orderData.add(orderDTO.getRecipientPhone());
        orderData.add(orderDTO.getRecipientAddress());
        orderData.add(orderDTO.getOrderStatus());
        orderData.add(orderDTO.getCourierFee());
        orderData.add(orderDTO.getCourierFee());
        orderData.add(orderDTO.getRemark());

        return new ModelAndView(new OrderPDFView(), "orderData", orderData);
    }
}

