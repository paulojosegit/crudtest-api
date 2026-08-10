package com.crudcompany.crudtestapi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.crudcompany.crudtestapi.domain.Customer;
import com.crudcompany.crudtestapi.repository.CustomerRepository;
import com.crudcompany.crudtestapi.service.CustomerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;


@RestController
@RequestMapping("/customers")
public class CustomerController {

    private static final Logger log =
            LoggerFactory.getLogger(CustomerService.class);

    public CustomerService service;

    public CustomerController(CustomerService service) {
        log.info("LOG DE TESTEEEEEE");
        this.service = service;
    }

    @GetMapping
    public Flux<Customer> getAll() {
        
        return service.findAll();
    }

}
