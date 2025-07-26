package ng.tmdc.kanban.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ng.tmdc.kanban.enums.Availability;
import ng.tmdc.kanban.enums.ProductCategory;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * Represents a product in the system.
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "products")
public class ProductModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(nullable = false, updatable = false)
    private UUID productId;

    /**
     * Name of the product.
     */
    @NotBlank(message = "Name is mandatory")
    @Size(min = 2, max = 100, message = "Name must be 2-100 characters")
    @Column(nullable = false, length = 100)
    private String name;

    /**
     * Category of the product.
     */
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private ProductCategory category;

    /**
     * Price of the product.
     */
    @Column
    @Min(0)
    private BigDecimal price;

    /**
     * Quantity in stock.
     */
    @Column
    @Min(0)
    private int quantity;

    /**
     * Expiry date of the product.
     */
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date expiryDate;

    /**
     * Image URL of the product.
     */
    @Column
    private String imageUrl;

    /**
     * Availability status.
     */
    @Column
    @Enumerated(EnumType.STRING)
    private Availability availability;

    /**
     * Threshold for low stock alert.
     */
    @Column
    @Min(0)
    private int threshold;
}