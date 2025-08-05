package ng.tmdc.kanban.records;

import org.springframework.lang.Nullable;

public record CreateSupplierRequest(
        @Nullable String name,
        @Nullable String profileImageUrl,
        @Nullable String email,
        @Nullable String phoneNumber
) {
}
