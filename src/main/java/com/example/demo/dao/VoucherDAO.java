package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



import com.example.demo.entity.Voucher;

public interface VoucherDAO extends JpaRepository<Voucher, Integer> {

}
