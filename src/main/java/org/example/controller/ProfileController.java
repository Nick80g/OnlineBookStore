package org.example.controller;

import org.example.DTO.UserDTO;
import org.example.entity.User;
import org.example.mappers.UserMapper;
import org.example.repository.UserRepository;
import org.example.service.BookService;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserMapper mapper;

    @GetMapping("/profile")
    public String profile(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        UserDTO userDTO = mapper.getUserDTO(userRepository.findByUsername(userName));
        model.addAttribute("user", userDTO);
        model.addAttribute("userBooks", userDTO.getBooks());
        return "profile";
    }
}
