package ng.tmdc.kanban.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "suppliers")
public class SupplierModel {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(nullable = false, updatable = false)
    private UUID supplierId;


    @NotBlank(message = "Name is mandatory")
    @Size(min = 2, max = 100, message = "Name must be 2-100 characters")
    @Column(nullable = false, length = 100, unique = true)
    private String name;

    @Column
    private String profileImageUrl;

    @Embedded
    private ContactInfoModel contactInfo;

    @OneToMany(mappedBy = "supplier", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<StoreModel> stores;

    @JsonManagedReference
    @OneToMany(mappedBy = "supplier", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProductModel> products;
}
