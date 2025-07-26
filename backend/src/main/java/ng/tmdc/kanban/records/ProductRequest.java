package ng.tmdc.kanban.records;

import ng.tmdc.kanban.enums.Availability;
import ng.tmdc.kanban.enums.ProductCategory;

import java.math.BigDecimal;
import java.util.Date;

public record ProductRequest(String name,
                             ProductCategory category,
                             BigDecimal price,
                             int quantity,
                             Date expiryDate,
                             int threshold,
                             String imageUrl,
                             Availability availability) {

    public ProductRequest {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("Name cannot be null or blank");
        }
        if (category == null) {
            throw new IllegalArgumentException("Category cannot be null");
        }
        if (price.intValue() < 0) {
            throw new IllegalArgumentException("Price cannot be negative");
        }
        if (quantity < 0) {
            throw new IllegalArgumentException("Quantity cannot be negative");
        }
        if (expiryDate == null) {
            throw new IllegalArgumentException("Expiry date cannot be null");
        }
        if (threshold < 0) {
            throw new IllegalArgumentException("Threshold cannot be negative");
        }
        if (availability == null) {
            throw new IllegalArgumentException("Availability cannot be null");
        }
    }
}
