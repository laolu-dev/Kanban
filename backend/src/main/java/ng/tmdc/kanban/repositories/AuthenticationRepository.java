package ng.tmdc.kanban.repositories;

import ng.tmdc.kanban.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthenticationRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByEmail(String email);
}
