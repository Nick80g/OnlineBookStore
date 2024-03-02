package org.example.service;

import org.example.entity.Book;
import org.example.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {


    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> allBooks(){
        return bookRepository.findAll();
    }

    public Book findByName(String name){
        return bookRepository.findByName(name);
    }

    public boolean delete(String name){
        Book bookFromDB = bookRepository.findByName(name);
        if (bookFromDB != null) {
            bookRepository.deleteByName(name);
            return true;
        }
        return false;
    }
}
