package ng.tmdc.kanban.services;

import ng.tmdc.kanban.repositories.StoresRepository;
import org.springframework.stereotype.Service;

@Service
public class StoreService {
    final StoresRepository repository;

    public StoreService(StoresRepository repository) {
        this.repository = repository;
    }
}
