package com.crudcompany.crudtestapi.repository;

import com.crudcompany.crudtestapi.domain.Customer;
import org.springframework.data.repository.reactive.ReactiveCrudRepository;
import reactor.core.publisher.Flux;

public interface CustomerRepository extends ReactiveCrudRepository<Customer, Long> {

    Flux<Customer> findAll();
}
