package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.records.UpdateProductRequest;
import ng.tmdc.kanban.services.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("api/v1/products")
public class ProductController {
    private final ProductService service;

    public ProductController(ProductService service) {
        this.service = service;
    }


    @GetMapping()
    ResponseEntity<ApiResponse<List<ProductModel>>> getAllProducts() {
        ApiResponse<List<ProductModel>> response = new ApiResponse<>();

        response.setStatus(ApiResponseStatus.SUCCESS);
        response.setMessage("Products retrieved successfully");
        response.setData(service.getAllProducts());

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping("/add")
    ResponseEntity<ApiResponse<ProductModel>> createProduct(@RequestBody ProductRequest request) {
        try {
            ApiResponse<ProductModel> response = new ApiResponse<>();
            final ProductModel product = service.addProduct(request);

            response.setStatus(ApiResponseStatus.SUCCESS);
            response.setMessage("Product added successfully");
            response.setData(product);

            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(response);

        } catch (Exception e) {
            System.out.println(e.getMessage());

            ApiResponse<ProductModel> response = new ApiResponse<>();
            response.setStatus(ApiResponseStatus.ERROR);
            response.setError("Failed to add product");

            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(response);
        }
    }

    @PutMapping("/update/{id}")
    ResponseEntity<ApiResponse<ProductModel>> updateProduct(@PathVariable UUID id, @RequestBody UpdateProductRequest request) {
        try {
            ApiResponse<ProductModel> response = new ApiResponse<>();
            final ProductModel product = service.updateProduct(id, request);

            response.setStatus(ApiResponseStatus.SUCCESS);
            response.setMessage("Updated product successfully");
            response.setData(product);

            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(response);

        } catch (Exception e) {
            System.out.println(e.getMessage());

            ApiResponse<ProductModel> response = new ApiResponse<>();
            response.setStatus(ApiResponseStatus.ERROR);
            response.setError("Failed to update product");

            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(response);
        }
    }

    @DeleteMapping("/delete/{id}")
    ResponseEntity<ApiResponse<ProductModel>> deleteProduct(@PathVariable UUID id) {
        try {
            ApiResponse<ProductModel> response = new ApiResponse<>();
            service.deleteProduct(id);

            response.setStatus(ApiResponseStatus.SUCCESS);
            response.setMessage("Successfully deleted product");

            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(response);

        } catch (Exception e) {
            System.out.println(e.getMessage());

            ApiResponse<ProductModel> response = new ApiResponse<>();
            response.setStatus(ApiResponseStatus.ERROR);
            response.setError("Failed to delete product");

            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(response);
        }
    }

}
