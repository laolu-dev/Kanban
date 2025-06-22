package ng.tmdc.kanban.repositories;

import ng.tmdc.kanban.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationRepository extends JpaRepository<UserEntity, Integer> {
    UserEntity findByEmail(String email);
}
