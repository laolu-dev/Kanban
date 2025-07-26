package ng.tmdc.kanban.records;

import ng.tmdc.kanban.enums.Availability;
import ng.tmdc.kanban.enums.ProductCategory;
import org.springframework.lang.Nullable;

public record UpdateProductRequest(
        @Nullable String name,
        @Nullable ProductCategory category,
        @Nullable Double price,
        @Nullable Integer quantity,
        @Nullable String expiryDate,
        @Nullable Integer threshold,
        @Nullable Availability availability,
        @Nullable String imageUrl) {
}
