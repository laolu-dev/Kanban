package ng.tmdc.kanban.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
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

    @NotBlank(message = "Name is mandatory")
    @Size(min = 2, max = 100, message = "Name must be 2-100 characters")
    @Column(nullable = false, length = 100)
    private String name;


    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private ProductCategory category;

    @Column
    @Min(0)
    private BigDecimal price;

    @Column
    @Min(0)
    private int quantity;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date expiryDate;

    @Column
    private String imageUrl;

    @Column
    @Enumerated(EnumType.STRING)
    private Availability availability;

    @Column
    @Min(0)
    private int threshold;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supplier_id", nullable = false)
    private SupplierModel supplier;
}