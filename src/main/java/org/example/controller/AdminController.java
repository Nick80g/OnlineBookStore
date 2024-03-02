package org.example.controller;

import org.example.service.BookService;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("allBooks", bookService.allBooks());
        return "admin";
    }
    @PostMapping("/admin")
    public String deleteBook(@RequestParam(required = true, defaultValue = "" ) String bookName,
                             @RequestParam(required = true, defaultValue = "" ) String action,
                             Model model) {
        if (action.equals("delete")){
            bookService.delete(bookName);
        }
        return "redirect:/admin";
    }
}