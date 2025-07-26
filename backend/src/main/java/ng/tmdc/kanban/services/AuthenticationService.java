package ng.tmdc.kanban.services;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import ng.tmdc.kanban.models.UserModel;
import ng.tmdc.kanban.records.CreateUserRequest;
import ng.tmdc.kanban.records.LoginRequest;
import ng.tmdc.kanban.repositories.AuthenticationRepository;
import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
    final AuthenticationRepository repository;

    public AuthenticationService(AuthenticationRepository repository) {
        this.repository = repository;
    }

    public ApiResponse<UserModel> createAccount(CreateUserRequest request) {
        ApiResponse<UserModel> response = new ApiResponse<>();

        if (repository.findByEmail(request.email()) != null) {
            response.setError("Email already registered");
            response.setStatus(ApiResponseStatus.ERROR);
            return response;
        }

        UserModel user = UserModel.builder()
                .name(request.name())
                .email(request.email())
                .password(request.password())
                .build();

        UserModel savedUser = repository.save(user);
        response.setData(savedUser);
        response.setMessage("Account created successfully");
        response.setStatus(ApiResponseStatus.SUCCESS);

        return response;
    }

    public ApiResponse<UserModel> login(LoginRequest request) {
        ApiResponse<UserModel> response = new ApiResponse<>();
        UserModel user = repository.findByEmail(request.email());

        if (user == null) {
            response.setError("There is no user with that email");
            response.setStatus(ApiResponseStatus.ERROR);
            return response;
        }

        if (!user.getPassword().equals(request.password())) {
            response.setError("Incorrect password");
            response.setStatus(ApiResponseStatus.ERROR);
            return response;
        }

        // Optionally, you can clear the password before returning the user
        user.setPassword(null);
        response.setStatus(ApiResponseStatus.SUCCESS);
        response.setMessage("Successfully logged in");
        response.setData(user);

        return response;
    }

}
