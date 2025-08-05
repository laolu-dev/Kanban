package ng.tmdc.kanban.repositories;

import ng.tmdc.kanban.models.SupplierModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SuppliersRepository extends JpaRepository<SupplierModel, UUID> {
}
