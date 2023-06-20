package com.example.skiplocked.repository;

import com.example.skiplocked.domain.Coupon;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

@Profile(value = {"mysql", "default", "local"})
@Repository
public class CouponMySQLRepository implements CouponNativeRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Coupon findCouponByMemberIsNullWithForUpdateSkipLocked() {
        return (Coupon) em.createNativeQuery("select * from coupon as c " +
                        "where c.member_id is null " +
                        "order by c.coupon_id asc limit 1 for update skip locked", Coupon.class)
                .getSingleResult();
    }

    @Override
    public Coupon findCouponByMemberIsNullWithForUpdate() {
        return (Coupon) em.createNativeQuery("select * from coupon as c " +
                        "where c.member_id is null " +
                        "order by c.coupon_id asc limit 1 for update", Coupon.class)
                .getSingleResult();
    }

}
