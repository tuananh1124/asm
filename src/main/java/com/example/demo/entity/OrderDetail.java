package com.example.demo.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "price")
    private Float price;

    @Column(name = "quantity")
    private Integer quantity;

    @ManyToOne
    @JoinColumn(name = "voucherid")
    private Voucher voucher;

    @ManyToOne
    @JoinColumn(name = "colorid")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "capacityid")
    private Capacity capacity;

    @ManyToOne
    @JoinColumn(name = "orderid")
    @JsonBackReference
    private Order order;

    @ManyToOne
    @JoinColumn(name = "productid")
    private Product product;
}