package mysql.issue2.repository;

import mysql.issue2.domain.Items;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ItemsRepository extends JpaRepository<Items, Long> {
    Optional<Items> findByItemId(String itemId);
}
