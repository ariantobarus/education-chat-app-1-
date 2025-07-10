package com.education.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.ResponseBody; // <-- HAPUS IMPORT INI

@Controller
public class HomeController {

    @GetMapping("/")
    // @ResponseBody // <-- HAPUS ANOTASI INI
    public String home() {
        return "index"; // <-- KEMBALIKAN SEPERTI SEMULA
    }

    // ... sisa kode biarkan saja ...
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }
    // ...dan seterusnya
}