package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.entity.Account;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;

import jakarta.transaction.Transactional;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {

	@Query("SELECT od FROM OrderDetail od WHERE od.order.id = :orderid")
	Optional<OrderDetail> findFirstByOrderId(@Param("orderid") Integer orderid);
}
