package com.example.skiplocked.domain;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "coupon",
        indexes = {
                @Index(name = "code_name_index", columnList = "codeName")
        }
)
@Getter
@NoArgsConstructor
public class Coupon extends BaseEntity {

    @Id @GeneratedValue
    @Column(name = "coupon_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;
    private LocalDateTime validityDate;

    private String codeName;

    @Builder
    public Coupon(LocalDateTime validityDate, String codeName) {
        this.validityDate = validityDate;
        this.codeName = codeName;
    }

    public void changeMember(Member member) {
        this.member = member;
    }
}
