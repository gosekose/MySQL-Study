package com.example.skiplocked.service.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@NoArgsConstructor
public class CouponDto {
    private String codeName;
    private LocalDateTime registerDate;
    private LocalDateTime validityDate;

    @Builder
    public CouponDto(String codeName, LocalDateTime registerDate, LocalDateTime validityDate) {
        this.codeName = codeName;
        this.registerDate = registerDate;
        this.validityDate = validityDate;
    }
}
