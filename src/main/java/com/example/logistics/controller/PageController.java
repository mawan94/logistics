package com.example.logistics.controller;

import java.text.DateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("/home")
    public String hello(Model m) {
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
}