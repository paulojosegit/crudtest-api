package com.crudcompany.crudtestapi.domain;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table(name = "customer")
public class Customer {

    @Id
    @Column("id")
    private Long id;

    @Column("name")
    private String name;

    @Column("lastname")
    private String lastName;

    @Column("birthday")
    private String birthDay;

    @Column("email")
    private String email;

    @Column("sex")
    private String sex;

    @Column("telephone")
    private String telephone;
}