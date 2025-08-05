package ng.tmdc.kanban.services;

import ng.tmdc.kanban.exception.BusinessException;
import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.models.SupplierModel;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.records.UpdateProductRequest;
import ng.tmdc.kanban.repositories.ProductRepository;
import ng.tmdc.kanban.repositories.SuppliersRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {
    final ProductRepository repository;
    final SuppliersRepository supplierRepository;

    public ProductService(ProductRepository repository, SuppliersRepository supplierRepository) {
        this.repository = repository;
        this.supplierRepository = supplierRepository;
    }

    public ProductModel addProduct(ProductRequest request) throws BusinessException {
        SupplierModel supplier = supplierRepository.findById(request.supplierId())
                .orElseThrow(() -> new BusinessException("This supplier does not exist", HttpStatus.BAD_REQUEST));

        final ProductModel product = ProductModel.builder()
                .name(request.name())
                .category(request.category())
                .price(request.price())
                .quantity(request.quantity())
                .expiryDate(request.expiryDate())
                .threshold(request.threshold())
                .availability(request.availability())
                .imageUrl(request.imageUrl())
                .supplier(supplier)
                .build();

        return repository.save(product);
    }

    public List<ProductModel> getAllProducts() {
        return repository.findAll();
    }

    public ProductModel updateProduct(UUID id, UpdateProductRequest request) throws Exception {
        final ProductModel product = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        if (request.name() != null) product.setName(request.name());
        if (request.category() != null) product.setCategory(request.category());
        if (request.price() != null) product.setPrice(request.price());
        if (request.quantity() != null) product.setQuantity(request.quantity());
        if (request.expiryDate() != null) product.setExpiryDate(Date.valueOf(request.expiryDate()));
        if (request.threshold() != null) product.setThreshold(request.threshold());
        if (request.imageUrl() != null) product.setImageUrl(request.imageUrl());
        if (request.availability() != null) product.setAvailability(request.availability());

        return repository.save(product);
    }

    public void deleteProduct(UUID id) {
        repository.deleteById(id);
    }
}
