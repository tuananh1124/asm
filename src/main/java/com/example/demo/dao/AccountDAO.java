package com.example.demo.dao;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.entity.Account;

import jakarta.transaction.Transactional;

public interface AccountDAO extends JpaRepository<Account, String> {
	Account findByUsername(String username);

	@Transactional
	@Modifying
	@Query("UPDATE Account a SET a.activated = true WHERE a.username = :username")
	void setActivatedByUsername(String username);

	@Transactional
	@Modifying
	@Query("UPDATE Account a SET a.password = :password WHERE a.username = :username")
	void updatePassword(String password, String username);

	@Transactional
	@Modifying
	@Query("UPDATE Account a SET a.admin = :admin, a.birthday = :birthday, a.gender = :gender, a.fullname = :fullname, a.photo = :photo WHERE a.username = :username")
	void updateAccount(@Param("admin") Boolean admin, @Param("birthday") Date birthday, @Param("gender") Boolean gender,
			@Param("fullname") String fullname, @Param("photo") String photo, @Param("username") String username);

}
