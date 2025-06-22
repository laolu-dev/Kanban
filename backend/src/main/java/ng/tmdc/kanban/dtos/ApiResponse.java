package ng.tmdc.kanban.dtos;

import com.fasterxml.jackson.annotation.JsonInclude;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import org.springframework.lang.Nullable;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {
    public ApiResponse() {
    }

    public ApiResponse(ApiResponseStatus status, String message, @Nullable T data, @Nullable String error) {
        this.status = status;
        this.message = message;
        this.data = data;
        this.error = error;
    }

    public ApiResponseStatus status;

    public String message;

    @Nullable
    public T data;

    @Nullable
    public String error;

    public void setMessage(String message) {
        this.message = message;
    }

    public void setData(@Nullable T data) {
        this.data = data;
    }

    public void setError(@Nullable String error) {
        this.error = error;
    }

    public void setStatus(ApiResponseStatus apiResponseStatus) {
        this.status = apiResponseStatus;
    }
}
