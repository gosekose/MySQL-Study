package com.example.skiplocked.repository;

import com.example.skiplocked.domain.Coupon;
import com.example.skiplocked.domain.Member;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
@ActiveProfiles("default")
class CouponMySQLRepositoryTest {

    @Autowired CouponNativeRepository couponNativeRepository;
    @Autowired CouponRepository couponRepository;

    @Test
    @DisplayName("coupon에서 member가 등록되지 않은 쿠폰을 가져오기 for update")
    public void findCouponByMemberIsNullWithForUpdate() throws Exception {
        //given
        couponRepository.save(Coupon.builder().codeName(UUID.randomUUID().toString())
                .validityDate(LocalDateTime.now().plusDays(10)).build());

        //when
        Coupon coupon = couponNativeRepository.findCouponByMemberIsNullWithForUpdate();

        //then
        System.out.println("coupon.getValidityDate() = " + coupon.getValidityDate());
        System.out.println("coupon.getCodeName() = " + coupon.getCodeName());
        assertThat(coupon.getMember()).isNull();
        assertThat(coupon).isNotNull();
    }

    @Test
    @DisplayName("coupon에서 member가 등록되지 않은 쿠폰을 가져오기 for update")
    public void findCouponByMemberIsNullWithForUpdateSkipLocked() throws Exception {
        //given
        couponRepository.save(Coupon.builder().codeName(UUID.randomUUID().toString())
                .validityDate(LocalDateTime.now().plusDays(10)).build());

        //when
        Coupon coupon = couponNativeRepository.findCouponByMemberIsNullWithForUpdateSkipLocked();

        //then
        System.out.println("coupon.getValidityDate() = " + coupon.getValidityDate());
        System.out.println("coupon.getCodeName() = " + coupon.getCodeName());
        assertThat(coupon.getMember()).isNull();
        assertThat(coupon).isNotNull();
    }
}