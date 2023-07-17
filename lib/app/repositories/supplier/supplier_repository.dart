import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_near_by_me_model.dart';

abstract class SupplierRepository {
  Future<List<SupplierCategoryModel>> getCategories();
  Future<List<SupplierNearByMeModel>> findNearBy(AddressEntity address);
}