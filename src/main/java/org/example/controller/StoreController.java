package org.example.controller;

import org.example.entity.Book;
import org.example.entity.User;
import org.example.repository.UserRepository;
import org.example.service.BookService;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StoreController {

    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @GetMapping("/books")
    public String  books(Model model){
        model.addAttribute("allBooks", bookService.allBooks());
        return "books";
    }

    @PostMapping("/books")
    public String  buyBook(@RequestParam(required = true, defaultValue = "" ) String bookName,
                           @RequestParam(required = true, defaultValue = "" ) String action,
                           RedirectAttributes attributes) {
        if (action.equals("buy")){
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User currentUser = userRepository.findByUsername(authentication.getName());
            Book currentBook = bookService.findByName(bookName);
            long balance = currentUser.getWallet() - currentBook.getPrice();
//            if(balance < 0) {
//                attributes.addAttribute("notEnoughMoney", "Не достаточно денег.");
//                return "redirect:/books";
//           }
//           else
//            {
            currentUser.getBooks().add(currentBook);
            currentUser.setWallet(balance);
            userRepository.save(currentUser);
 //          }
        }
        return "redirect:/books";
    }

    @GetMapping("/bookPage")
    public String bookPage(@RequestParam(required = true, defaultValue = "" ) String bookName, Model model){
        Book currentBook = bookService.findByName(bookName);
        model.addAttribute("book", currentBook);
        return "bookPage";
    }
}
