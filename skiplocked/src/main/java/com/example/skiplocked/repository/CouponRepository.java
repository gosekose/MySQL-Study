package com.example.skiplocked.repository;

import com.example.skiplocked.domain.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CouponRepository extends JpaRepository<Coupon, Long> {
    Coupon findCouponByCodeName(String codeName);
}
