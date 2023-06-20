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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("default")
class CouponServiceManyCouponTest {

    @Autowired CouponService couponService;
    @Autowired MemberRepository memberRepository;
    @Autowired CouponRepository couponRepository;
    private static final String EMAIL = "gose";

    @BeforeEach
    void init() {
        ArrayList<Member> members = new ArrayList<>();
        ArrayList<Coupon> coupons = new ArrayList<>();

        for (int i = 0; i < 50; i++) {
            members.add(Member.builder().email(EMAIL + i).build());
            coupons.add(Coupon.builder()
                    .codeName(UUID.randomUUID().toString())
                    .validityDate(LocalDateTime.now().plusDays(10)).build());
        }

        memberRepository.saveAll(members);
        couponRepository.saveAll(coupons);
    }

    @AfterEach
    void clear() {
        couponRepository.deleteAll();
        memberRepository.deleteAll();
    }

    @Test
    @DisplayName(
            """
               스레드: 단일
               인원: 40
               상황: 쿠폰 등록 요청할 때 for update
            """
    )
    public void registerCouponForUpdate_single_40() throws Exception {
        for (int i = 0; i < 40; i++) {

            //given
            Member member = memberRepository.findMemberByEmail(EMAIL + i);

            //when
            CouponDto couponDto = couponService.registerCouponForUpdate(member);
            Coupon findCoupon = couponService.findCouponByCodeName(couponDto.getCodeName());

            //then
            assertThat(couponDto.getCodeName()).isNotNull();
            assertThat(findCoupon.getMember()).isEqualTo(member);
        }
    }


    @Test
    @DisplayName(
            """
               스레드: 단일
               인원: 40
               상황: 쿠폰 등록 요청할 때 for update skip locked
            """
    )
    public void registerCouponForUpdateSkipLocked_single_40() throws Exception {
        for (int i = 0; i < 40; i++) {

            //given
            Member member = memberRepository.findMemberByEmail(EMAIL + i);

            //when
            CouponDto couponDto = couponService.registerCouponForUpdateSkipLocked(member);
            Coupon findCoupon = couponService.findCouponByCodeName(couponDto.getCodeName());

            //then
            assertThat(couponDto.getCodeName()).isNotNull();
            assertThat(findCoupon.getMember()).isEqualTo(member);
        }
    }

    @Test
    @DisplayName(
            """
               스레드: 멀티
               격리수준: read commited
               인원: 40
               상황: 쿠폰 등록 요청할 때 for update skip locked
               테스트: 실패
               성능: 3초 38
            """
    )
    public void registerCouponForUpdate_multi_40() throws Exception {
        //given
        int theadCount = 40;
        CountDownLatch latch = new CountDownLatch(theadCount);
        ExecutorService executorService = Executors.newFixedThreadPool(32);

        //when
        Coupon[] coupons = new Coupon[theadCount];

        for (int i = 0; i < theadCount; i++) {
            int finalIdx = i;
            executorService.submit(() -> {
                try {
                    Member member = memberRepository.findMemberByEmail(EMAIL + finalIdx);
                    CouponDto couponDto = couponService.registerCouponForUpdate(member);
                    coupons[finalIdx] = couponService.findCouponByCodeName(couponDto.getCodeName());

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    latch.countDown();
                }
            });
        }
        latch.await();

        //then
        int issuedCoupon = 0; // 발급된 쿠폰을 받은 유저의 수가 40개야 함
        HashSet<String> codeNames = new HashSet<>(); // 발급된 codeName의 개수가 40개야 함

        for (int i = 0; i < theadCount; i++) {
            Coupon coupon = coupons[i];
            if (coupon != null) {
                if (coupon.getMember() != null) issuedCoupon++;
                if (coupon.getCodeName() != null) codeNames.add(coupon.getCodeName());
            }
        }

        assertThat(issuedCoupon).isEqualTo(40);
        assertThat(codeNames.size()).isEqualTo(40);
    }

    @Test
    @DisplayName(
            """
               스레드: 멀티
               격리수준: read commited
               인원: 40
               상황: 쿠폰 등록 요청할 때 for update skip locked
               테스트: 성공 
               성능: 1초 717
            """
    )
    public void registerCouponForUpdateSkipLocked_multi_40() throws Exception {
        //given
        int theadCount = 40;
        CountDownLatch latch = new CountDownLatch(theadCount);
        ExecutorService executorService = Executors.newFixedThreadPool(32);

        //when
        Coupon[] coupons = new Coupon[theadCount];

        for (int i = 0; i < theadCount; i++) {
            int finalIdx = i;
            executorService.submit(() -> {
                try {
                    Member member = memberRepository.findMemberByEmail(EMAIL + finalIdx);
                    CouponDto couponDto = couponService.registerCouponForUpdateSkipLocked(member);
                    coupons[finalIdx] = couponService.findCouponByCodeName(couponDto.getCodeName());

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    latch.countDown();
                }
            });
        }
        latch.await();

        //then
        int issuedCoupon = 0; // 발급된 쿠폰을 받은 유저의 수가 40개야 함
        HashSet<String> codeNames = new HashSet<>(); // 발급된 codeName의 개수가 40개야 함

        for (int i = 0; i < theadCount; i++) {
            Coupon coupon = coupons[i];
            if (coupon != null) {
                if (coupon.getMember() != null) issuedCoupon++;
                if (coupon.getCodeName() != null) codeNames.add(coupon.getCodeName());
            }
        }

        assertThat(issuedCoupon).isEqualTo(40);
        assertThat(codeNames.size()).isEqualTo(40);
    }
}