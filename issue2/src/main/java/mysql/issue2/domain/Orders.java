package mysql.issue2.domain;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Orders {

    @Id @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id")
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "items")
    private Items items;

    private String orderId;

    @Builder
    public Orders(Member member, Items items) {
        this.member = member;
        this.items = items;
        this.orderId = UUID.randomUUID().toString();
    }

    public static Orders of(Member member, Items items) {
        return new Orders(member, items);
    }

}
