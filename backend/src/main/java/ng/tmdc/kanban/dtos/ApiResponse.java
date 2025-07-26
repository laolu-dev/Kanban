package ng.tmdc.kanban.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import com.fasterxml.jackson.annotation.JsonInclude;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import org.springframework.lang.Nullable;


@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ApiResponse<T> {
    private ApiResponseStatus status;
    private String message;
    @Nullable
    private T data;
    @Nullable
    private String error;
}