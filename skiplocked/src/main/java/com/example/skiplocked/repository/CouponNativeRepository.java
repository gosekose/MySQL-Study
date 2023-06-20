package com.example.skiplocked.repository;

import com.example.skiplocked.domain.Coupon;
import org.springframework.stereotype.Repository;

@Repository
public interface CouponNativeRepository {
    Coupon findCouponByMemberIsNullWithForUpdateSkipLocked();
    Coupon findCouponByMemberIsNullWithForUpdate();
}
