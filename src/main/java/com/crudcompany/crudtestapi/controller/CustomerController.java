package com.crudcompany.crudtestapi.controller;

import com.crudcompany.crudtestapi.domain.Customer;
import com.crudcompany.crudtestapi.service.CustomerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    public CustomerService service;

    public CustomerController(CustomerService service) {
        this.service = service;
    }

    @GetMapping
    public Flux<Customer> getAll() {
        return service.findAll();
    }

}
