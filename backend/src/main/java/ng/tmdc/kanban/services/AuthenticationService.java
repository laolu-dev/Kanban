package ng.tmdc.kanban.services;

import ng.tmdc.kanban.entities.UserEntity;
import ng.tmdc.kanban.exception.BusinessException;
import ng.tmdc.kanban.records.CreateUserRequest;
import ng.tmdc.kanban.records.LoginRequest;
import ng.tmdc.kanban.repositories.AuthenticationRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class AuthenticationService {
    final AuthenticationRepository repository;

    public AuthenticationService(AuthenticationRepository repository) {
        this.repository = repository;
    }

    public void createAccount(CreateUserRequest request) {

        UserEntity user = new UserEntity(request.name(), request.email(), request.password());
        if (Objects.equals(repository.findByEmail(request.email()).getEmail(), request.email())) {
            throw new BusinessException("Email already registered", HttpStatus.CONFLICT);
        } else {
            repository.save(user);
        }

    }

    public UserEntity login(LoginRequest request) {
        return repository.findByEmail(request.email());
    }

}
