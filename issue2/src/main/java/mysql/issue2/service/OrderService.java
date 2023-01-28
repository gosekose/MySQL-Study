package mysql.issue2.service;

import lombok.RequiredArgsConstructor;
import mysql.issue2.controller.dto.CreateOrderDto;
import mysql.issue2.domain.Items;
import mysql.issue2.domain.Member;
import mysql.issue2.domain.Orders;
import mysql.issue2.repository.OrdersRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderService {

    private final MemberService memberService;
    private final ItemService itemService;
    private final OrdersRepository ordersRepository;

    /**
     * 유저 Id를 입력 받아 주문을 등록하고 주문 수량을 제거하는 메소드
     * 단일 트랜잭션 처리가 필요하므로 서비스를 분리하지 않고 하나의 메소드 내에 처리 필요
     *
     * 이와 같은 단일 데이터베이스라면, orderItem 메소드 내부에서는 트랜잭션 상황이므로 해당 데이터베이스가 락이 걸리지만
     * 데이터베이스가 각 서비스 로직마다 분산된 상황이라면 트랜젝션 처리를 어떻게 하는 것이 효과적일까요?
     *
     */
    public void orderItem(CreateOrderDto orderDto) {
        Member member = memberService.findByUserId(orderDto.getUserId());
        Items item = itemService.findByItemId(orderDto.getItemId());
        ordersRepository.save(Orders.of(member, item));
        item.minusQuantityOne(); // item-server 동기화 필요
    }
}
