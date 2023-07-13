import './supplier_repository.dart';
import '../../core/exceptions/failure.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import '../../models/supplier_category_model.dart';

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
}
