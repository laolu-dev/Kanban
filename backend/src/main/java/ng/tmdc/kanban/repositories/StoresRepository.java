package ng.tmdc.kanban.repositories;

import ng.tmdc.kanban.models.StoreModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface StoresRepository extends JpaRepository<StoreModel, UUID> {
}
