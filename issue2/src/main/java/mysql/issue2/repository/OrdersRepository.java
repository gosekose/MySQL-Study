package mysql.issue2.repository;

import mysql.issue2.domain.Member;
import mysql.issue2.domain.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

    List<Orders> findOrdersByMember(Member member);
}
