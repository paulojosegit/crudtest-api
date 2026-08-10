package com.crudcompany.crudtestapi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.crudcompany.crudtestapi.domain.Customer;
import com.crudcompany.crudtestapi.service.CustomerService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;


@RestController
@RequestMapping("/customers")
public class CustomerController {

    private Logger logger = LoggerFactory.getLogger(CustomerService.class.getName());
    public CustomerService service;

    public CustomerController(CustomerService service) {

        this.service = service;
    }

    @GetMapping
    public Flux<Customer> getAll() {
                
        return service.findAll().doOnComplete(() -> 
            logger.info("Chamada ao /Custormers concluída", service));
    }

}
