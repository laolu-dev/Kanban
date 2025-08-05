package ng.tmdc.kanban.records;

import ng.tmdc.kanban.enums.Availability;
import ng.tmdc.kanban.enums.ProductCategory;
import org.springframework.lang.Nullable;

import java.math.BigDecimal;

public record UpdateProductRequest(
        @Nullable String name,
        @Nullable ProductCategory category,
        @Nullable BigDecimal price,
        @Nullable Integer quantity,
        @Nullable String expiryDate,
        @Nullable Integer threshold,
        @Nullable Availability availability,
        @Nullable String imageUrl
) {
}
