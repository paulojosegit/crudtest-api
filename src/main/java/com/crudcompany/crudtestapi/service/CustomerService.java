package com.crudcompany.crudtestapi.service;

import com.crudcompany.crudtestapi.domain.Customer;
import com.crudcompany.crudtestapi.repository.CustomerRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;


@Service
public class CustomerService {
    private final CustomerRepository repository;

    private Logger logger = LoggerFactory.getLogger(CustomerService.class.getName());

    public CustomerService(CustomerRepository repository)
    {
        this.repository = repository;
    }

    public Flux<Customer> findAll() {
        logger.info("Iniciando a consulta ao repositório MYSQL");
        return repository.findAll();

    }
}
