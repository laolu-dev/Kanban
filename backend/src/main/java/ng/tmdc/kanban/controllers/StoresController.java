package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.services.ProductService;
import ng.tmdc.kanban.services.StoreService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/stores")
public class StoresController {
//    private final StoreService service;
//
//    public StoresController(StoreService service) {
//        this.service = service;
//    }
//
//    @PostMapping("/create")
//    ResponseEntity<ApiResponse<ProductModel>> createProduct(@RequestBody ProductRequest request) {
//        try {
//            ApiResponse<ProductModel> response = new ApiResponse<>();
//            final ProductModel product = service.addProduct(request);
//
//            response.setStatus(ApiResponseStatus.SUCCESS);
//            response.setMessage("Product added successfully");
//            response.setData(product);
//
//            return ResponseEntity
//                    .status(HttpStatus.CREATED)
//                    .body(response);
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//
//            ApiResponse<ProductModel> response = new ApiResponse<>();
//            response.setStatus(ApiResponseStatus.ERROR);
//            response.setError("Failed to add product");
//
//            return ResponseEntity
//                    .status(HttpStatus.BAD_REQUEST)
//                    .body(response);
//        }
//    }
}
