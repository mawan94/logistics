package com.example.logistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/home")
    public String home(Model m) {
        return "home";
    }

    @RequestMapping("/user-index")
    public String userIndex(Model m) {
        return "user-index";
    }

    @RequestMapping("/user-edit")
    public String userEdit(Model m) {
        return "user-edit";
    }

    @RequestMapping(value = {"/", "/login"})
    public String login(Model m) {
        return "login";  //视图重定向hello.jsp
    }

    @RequestMapping("/customer-home")
    public String customerHome(Model m) {
        return "customer-home";  //视图重定向hello.jsp
    }
}