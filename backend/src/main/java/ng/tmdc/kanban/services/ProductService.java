package ng.tmdc.kanban.services;

import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.records.UpdateProductRequest;
import ng.tmdc.kanban.repositories.ProductRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {
    final ProductRepository repository;

    public ProductService(ProductRepository repository) {
        this.repository = repository;
    }

    public ProductModel addProduct(ProductRequest request) throws Exception {
        final ProductModel product = ProductModel.builder()
                .name(request.name())
                .category(request.category())
                .price(request.price())
                .quantity(request.quantity())
                .expiryDate(request.expiryDate())
                .threshold(request.threshold())
                .availability(request.availability())
                .imageUrl(request.imageUrl())
                .build();

        return repository.save(product);
    }

    public List<ProductModel> getAllProducts() {
        return repository.findAll();
    }

    public ProductModel updateProduct(UUID id, UpdateProductRequest request) throws Exception {
        final ProductModel productModel = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        switch (request) {
            case UpdateProductRequest update when update.name() != null ->
                    productModel.setName(update.name());
            case UpdateProductRequest update when update.category() != null ->
                    productModel.setCategory(update.category());
            case UpdateProductRequest update when update.price() != null ->
                    productModel.setPrice(BigDecimal.valueOf(update.price()));
            case UpdateProductRequest update when update.quantity() != null ->
                    productModel.setQuantity(update.quantity());
            case UpdateProductRequest update when update.expiryDate() != null ->
                    productModel.setExpiryDate(Date.valueOf(update.expiryDate()));
            case UpdateProductRequest update when update.threshold() != null ->
                    productModel.setThreshold(update.threshold());
            case UpdateProductRequest update when update.imageUrl() != null ->
                    productModel.setImageUrl(update.imageUrl());
            case UpdateProductRequest update when update.availability() != null ->
                    productModel.setAvailability(update.availability());
            default -> throw new IllegalArgumentException("Invalid request");
        }

        return productModel;
    }
}
