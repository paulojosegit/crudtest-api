package com.crudcompany.crudtestapi.service;

import com.crudcompany.crudtestapi.domain.Customer;
import com.crudcompany.crudtestapi.repository.CustomerRepository;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

@Service
public class CustomerService {
    private final CustomerRepository repository;

    public CustomerService(CustomerRepository repository) {
        this.repository = repository;
    }

    public Flux<Customer> findAll() {
        return repository.findAll();
    }
}
