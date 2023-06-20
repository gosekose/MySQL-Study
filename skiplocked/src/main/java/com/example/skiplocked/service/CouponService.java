package com.example.skiplocked.service;

import com.example.skiplocked.domain.Coupon;
import com.example.skiplocked.domain.Member;
import com.example.skiplocked.repository.CouponNativeRepository;
import com.example.skiplocked.repository.CouponRepository;
import com.example.skiplocked.service.dto.CouponDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class CouponService {

    private final CouponNativeRepository couponNativeRepository;
    private final CouponRepository couponRepository;

    public CouponDto registerCouponForUpdate(Member member) {
        Coupon coupon = couponNativeRepository.findCouponByMemberIsNullWithForUpdate();
        if (coupon != null) {
            coupon.changeMember(member);
            return CouponDto.builder().codeName(coupon.getCodeName())
                    .registerDate(coupon.getCreatedAt())
                    .validityDate(coupon.getValidityDate()).build();
        }

        throw new IllegalArgumentException("가능한 쿠폰이 없습니다.");
    }

    public CouponDto registerCouponForUpdateSkipLocked(Member member) {
        Coupon coupon = couponNativeRepository.findCouponByMemberIsNullWithForUpdateSkipLocked();
        if (coupon != null) {
            coupon.changeMember(member);
            return CouponDto.builder().codeName(coupon.getCodeName())
                    .registerDate(coupon.getCreatedAt())
                    .validityDate(coupon.getValidityDate()).build();
        }

        throw new IllegalArgumentException("가능한 쿠폰이 없습니다.");
    }

    @Transactional(readOnly = true)
    public Coupon findCouponByCodeName(String codeName) {
        return couponRepository.findCouponByCodeName(codeName);
    }
}
