package mysql.issue2.controller.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CreateOrderDto {

    private String userId;
    private String itemId;

}
