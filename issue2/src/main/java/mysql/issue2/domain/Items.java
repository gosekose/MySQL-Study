package mysql.issue2.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Items {

    @Id @GeneratedValue
    private Long id;

    private String itemId;
    private String itemName;
    private int quantity;

    @Builder
    public Items(String itemName, int quantity) {
        this.itemId = UUID.randomUUID().toString();
        this.itemName = itemName;
        this.quantity = quantity;
    }

    public void minusQuantityOne() {

        if (this.quantity > 0) {
            this.quantity--;
        } else {
            throw new IllegalStateException("수량이 0개 입니다.");
        }

    }

}
