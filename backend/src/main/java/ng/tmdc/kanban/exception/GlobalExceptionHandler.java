package ng.tmdc.kanban.exception;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {
    // Handle validation errors
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<?>> handleValidationExceptions(
            MethodArgumentNotValidException ex) {


        List<String> errors = ex.getBindingResult()
                .getFieldErrors()
                .stream()
                .map(error -> error.getField() + ": " + error.getDefaultMessage())
                .collect(Collectors.toList());

        ApiResponse<?> response = new ApiResponse<>();
        response.setStatus(ApiResponseStatus.ERROR);
        response.setMessage("Validation Failed");
        response.setError(String.valueOf(errors.stream().findFirst()));

        return ResponseEntity.badRequest().body(response);
    }

    // Handle custom business exceptions
//    @ExceptionHandler(BusinessException.class)
//    public ResponseEntity<ApiResponse<?>> handleBusinessException(
//            BusinessException ex) {
//
//        ApiResponse<?> response = new ApiResponse<>(
//                ApiResponseStatus.ERROR,
//                ex.getMessage(),
//                null
//        );
//
//        return ResponseEntity.status(ex.getHttpStatus()).body(response);
//    }

//    // Handle all other unexpected exceptions
//    @ExceptionHandler(Exception.class)
//    public ResponseEntity<ApiResponse<?>> handleAllExceptions(Exception ex) {
//        ApiResponse<?> response = new ApiResponse<>(
//                ApiResponseStatus.ERROR,
//                "Internal server error: " + ex.getMessage(),
//                null
//        );
//
//        return ResponseEntity.internalServerError().body(response);
//    }

//    @ExceptionHandler(BadCredentialsException.class)
//    public ResponseEntity<ApiResponse<?>> handleBadCredentials() {
//        ApiResponse<?> response = new ApiResponse<>(
//                ApiResponseStatus.ERROR,
//                "Invalid credentials",
//
//        );
//
//        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
//    }
}
