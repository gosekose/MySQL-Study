package mysql.issue2.service;

import lombok.RequiredArgsConstructor;
import mysql.issue2.domain.Items;
import mysql.issue2.repository.ItemsRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ItemService {

    private final ItemsRepository itemsRepository;

    public Items findByItemId(String itemId) {
        return itemsRepository.findByItemId(itemId).orElseThrow(() -> {throw new IllegalArgumentException("Error");});
    }

}
