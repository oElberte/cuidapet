import '../../models/supplier_model.dart';
import '../../models/supplier_services_model.dart';
import './supplier_service.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_near_by_me_model.dart';
import '../../repositories/supplier/supplier_repository.dart';

class SupplierServiceImpl extends SupplierService {
  final SupplierRepository _repository;

  SupplierServiceImpl({
    required SupplierRepository repository,
  }) : _repository = repository;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async => _repository.getCategories();

  @override
  Future<List<SupplierNearByMeModel>> findNearBy(AddressEntity address) async => _repository.findNearBy(address);

  @override
  Future<SupplierModel> findById(int id) async => _repository.findById(id);

  @override
  Future<List<SupplierServicesModel>> findServices(int supplierId) async => _repository.findServices(supplierId);
}
