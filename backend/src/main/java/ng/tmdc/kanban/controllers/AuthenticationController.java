package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.dtos.User;
import ng.tmdc.kanban.entities.UserEntity;
import ng.tmdc.kanban.enums.ApiResponseStatus;
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
    ResponseEntity<ApiResponse<Void>> createUserAccount(@RequestBody CreateUserRequest req) {
        ApiResponse<Void> response = new ApiResponse<>();
        service.createAccount(req);

        response.setStatus(ApiResponseStatus.SUCCESS);
        response.setMessage("Successfully created an account!");

        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @PostMapping("/login")
    ResponseEntity<ApiResponse<User>> login(@RequestBody LoginRequest req) {
        ApiResponse<User> response = new ApiResponse<>();
        UserEntity user = service.login(req);

        User createdUser = new User(user.getId(), user.getName(), user.getEmail());

        response.setStatus(ApiResponseStatus.SUCCESS);
        response.setMessage("Successfully logged in");
        response.setData(createdUser);

        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
