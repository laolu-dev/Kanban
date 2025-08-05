package ng.tmdc.kanban.services;

import ng.tmdc.kanban.exception.BusinessException;
import ng.tmdc.kanban.models.ContactInfoModel;
import ng.tmdc.kanban.models.ProductModel;
import ng.tmdc.kanban.models.SupplierModel;
import ng.tmdc.kanban.records.CreateSupplierRequest;
import ng.tmdc.kanban.records.ProductRequest;
import ng.tmdc.kanban.repositories.SuppliersRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class SuppliersService {
    final SuppliersRepository repository;

    public SuppliersService(SuppliersRepository repository) {
        this.repository = repository;
    }

    public SupplierModel createSupplier(CreateSupplierRequest request) throws BusinessException {
        ContactInfoModel contactInfo = new ContactInfoModel(request.email(), request.phoneNumber());

        final SupplierModel supplier = SupplierModel.builder()
                .name(request.name())
                .contactInfo(contactInfo)
                .profileImageUrl(request.profileImageUrl())
                .build();

        return repository.save(supplier);
    }
}
