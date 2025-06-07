package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.entities.UserEntity;
import ng.tmdc.kanban.records.CreateUserRequest;
import ng.tmdc.kanban.records.LoginRequest;
import ng.tmdc.kanban.services.AuthenticationService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthenticationController {
    private final AuthenticationService service;

    public AuthenticationController(AuthenticationService service) {
        this.service = service;
    }

    @PostMapping("/accounts/create")
    void createUserAccount(@RequestBody CreateUserRequest req) {
        service.createAccount(req);
    }

    @PostMapping("/accounts/login")
    UserEntity login(@RequestBody LoginRequest req) {
        return service.login(req);
    }
}
