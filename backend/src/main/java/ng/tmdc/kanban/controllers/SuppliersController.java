package ng.tmdc.kanban.controllers;

import ng.tmdc.kanban.dtos.ApiResponse;
import ng.tmdc.kanban.enums.ApiResponseStatus;
import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.models.SupplierModel;
import ng.tmdc.kanban.records.CreateSupplierRequest;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.services.StoreService;
import ng.tmdc.kanban.services.SuppliersService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/suppliers")
public class SuppliersController {
    private final SuppliersService service;

    public SuppliersController(SuppliersService service) {
        this.service = service;
    }

    @PostMapping
    ResponseEntity<ApiResponse<SupplierModel>> createSupplier(@RequestBody CreateSupplierRequest request) {
        try {
            ApiResponse<SupplierModel> response = new ApiResponse<>();
            final SupplierModel supplier = service.createSupplier(request);

            response.setStatus(ApiResponseStatus.SUCCESS);
            response.setMessage("Successfully created supplier");
            response.setData(supplier);

            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(response);

        } catch (Exception e) {
            System.out.println(e.getMessage());

            ApiResponse<SupplierModel> response = new ApiResponse<>();
            response.setStatus(ApiResponseStatus.ERROR);
            response.setError("Failed to create supplier");

            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(response);
        }
    }
}
