package org.example.mappers;

import org.example.DTO.UserDTO;
import org.example.entity.User;
import org.springframework.stereotype.Service;

@Service
public class UserMapper {

    public UserDTO getUserDTO(User user){
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setName(user.getUsername());
        userDTO.setWallet(user.getWallet());
        userDTO.setBooks(user.getBooks());
        return userDTO;
    }
}
