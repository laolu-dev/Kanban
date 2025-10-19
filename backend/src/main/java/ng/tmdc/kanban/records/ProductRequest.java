package ng.tmdc.kanban.records;

import ng.tmdc.kanban.enums.Availability;
import ng.tmdc.kanban.enums.ProductCategory;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

public record ProductRequest(
        String name,
        ProductCategory category,
        BigDecimal price,
        int quantity,
        Date expiryDate,
        int threshold,
        String imageUrl,
        Availability availability,
        UUID supplierId
) {
}
