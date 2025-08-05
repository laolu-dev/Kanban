package ng.tmdc.kanban.services;

import ng.tmdc.kanban.repositories.OrderRepository;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    final OrderRepository repository;

    public OrderService(OrderRepository repository) {
        this.repository = repository;
    }
}
