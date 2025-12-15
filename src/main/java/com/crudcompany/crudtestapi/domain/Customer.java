package com.crudcompany.crudtestapi.domain;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;

@Data
@Table(name = "customers")
public class Customer {

    @Id
    @Column("id")
    private Long id;

    @Column("name")
    private String name;

    @Column("lastname")
    private String lastName;

    @Column("birthday")
    private LocalDate birthDay;

    @Column("email")
    private String email;

    @Column("sex")
    private String sex;

    @Column("telephone")
    private String telephone;
}