import './supplier_repository.dart';
import '../../core/exceptions/failure.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_near_by_me_model.dart';

class SupplierRepositoryImpl extends SupplierRepository {
  final RestClient _restClient;
  final AppLogger _logger;

  SupplierRepositoryImpl({
    required RestClient restClient,
    required AppLogger logger,
  })  : _restClient = restClient,
        _logger = logger;

  @override
  Future<List<SupplierCategoryModel>> getCategories() async {
    try {
      final result = await _restClient.auth().get('/categories/');
      return result.data
          ?.map<SupplierCategoryModel>(
            (c) => SupplierCategoryModel.fromMap(c),
          )
          .toList();
    } on RestClientException catch (e, s) {
      const errorMessage = 'Erro ao buscar categorias dos fornecedores';
      _logger.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }

  @override
  Future<List<SupplierNearByMeModel>> findNearBy(AddressEntity address) async {
    try {
      final result = await _restClient.auth().get('/suppliers/', queryParameters: {
        'lat': address.lat,
        'lng': address.lng,
      });
      return result.data
          ?.map<SupplierNearByMeModel>(
            (supplierResponse) => SupplierNearByMeModel.fromMap(supplierResponse),
          )
          .toList();
    } on RestClientException catch (e, s) {
      const message = 'Erro ao buscar fornecedores próximos';
      _logger.error(message, e, s);
      throw Failure(message: message);
    }
  }
}
