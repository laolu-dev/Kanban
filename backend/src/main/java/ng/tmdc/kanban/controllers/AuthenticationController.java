package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.models.UserModel;
import ng.tmdc.kanban.records.CreateUserRequest;
import ng.tmdc.kanban.records.LoginRequest;
import ng.tmdc.kanban.services.AuthenticationService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/auth")
public class AuthenticationController {
    private final AuthenticationService service;

    public AuthenticationController(AuthenticationService service) {
        this.service = service;
    }

    @PostMapping("/register")
    ResponseEntity<ApiResponse<UserModel>> createUserAccount(@RequestBody CreateUserRequest request) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(service.createAccount(request));
    }

    @PostMapping("/login")
    ResponseEntity<ApiResponse<UserModel>> login(@RequestBody LoginRequest req) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(service.login(req));
    }
}
