package com.example.skiplocked.service;

import com.example.skiplocked.domain.Coupon;
import com.example.skiplocked.domain.Member;
import com.example.skiplocked.repository.CouponRepository;
import com.example.skiplocked.repository.MemberRepository;
import com.example.skiplocked.service.dto.CouponDto;
import org.junit.jupiter.api.AfterEach;
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

@SpringBootTest
@ActiveProfiles("default")
@Transactional
class CouponServiceOneCouponTest {

    @Autowired CouponService couponService;
    @Autowired MemberRepository memberRepository;
    @Autowired CouponRepository couponRepository;
    private static final String EMAIL = "gose";

    @BeforeEach
    void init() {
        for (int i = 1; i <= 1; i++) {
            memberRepository.save(Member.builder().email(EMAIL + i).build());
            couponRepository.save(Coupon.builder()
                            .codeName(UUID.randomUUID().toString())
                            .validityDate(LocalDateTime.now().plusDays(10)).build());
        }
    }

    @Test
    @DisplayName("회원 한명이 select for update를 활용하여 쿠폰 하나를 등록함")
    public void registerCouponForUpdate() throws Exception {
        //given
        Member member = memberRepository.findMemberByEmail(EMAIL + 1);

        //when
        CouponDto couponDto = couponService.registerCouponForUpdate(member);
        Coupon findCoupon = couponService.findCouponByCodeName(couponDto.getCodeName());

        //then
        assertThat(couponDto.getCodeName()).isNotNull();
        assertThat(findCoupon.getMember()).isEqualTo(member);
    }

    @Test
    @DisplayName("회원 한명이 select for update skip locked를 활용하여 쿠폰 하나를 등록함")
    public void registerCouponForUpdateSkipLocked() throws Exception {
        //given
        Member member = memberRepository.findMemberByEmail(EMAIL + 1);

        //when
        CouponDto couponDto = couponService.registerCouponForUpdateSkipLocked(member);
        Coupon findCoupon = couponService.findCouponByCodeName(couponDto.getCodeName());

        //then
        assertThat(couponDto.getCodeName()).isNotNull();
        assertThat(findCoupon.getMember()).isEqualTo(member);
    }
}