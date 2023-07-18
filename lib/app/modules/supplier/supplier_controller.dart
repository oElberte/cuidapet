import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
import '../../core/logger/app_logger.dart';
import '../../core/ui/widgets/loader.dart';
import '../../core/ui/widgets/messages.dart';
import '../../models/supplier_model.dart';
import '../../models/supplier_services_model.dart';
import '../../services/supplier/supplier_service.dart';

part 'supplier_controller.g.dart';

class SupplierController = SupplierControllerBase with _$SupplierController;

abstract class SupplierControllerBase with Store, ControllerLifeCycle {
  final SupplierService _supplierService;
  final AppLogger _log;

  int _supplierId = 0;

  @readonly
  SupplierModel? _supplier;

  @readonly
  var _supplierServices = <SupplierServicesModel>[];

  @readonly
  // ignore: prefer_final_fields
  var _selectedServices = <SupplierServicesModel>[].asObservable();

  SupplierControllerBase({
    required SupplierService supplierService,
    required AppLogger log,
  })  : _supplierService = supplierService,
        _log = log;

  @override
  void onInit([Map<String, dynamic>? params]) {
    if (params != null) {
      _supplierId = params['supplierId'] ?? 0;
    }
  }

  @override
  Future<void> onReady() async {
    try {
      Loader.show();
      await Future.wait([
        _findSupplierById(),
        _findSupplierServices(),
      ]);
    } finally {
      Loader.hide();
    }
  }

  @action
  Future<void> _findSupplierById() async {
    try {
      _supplier = await _supplierService.findById(_supplierId);
    } catch (e, s) {
      const message = 'Erro ao buscar dados do fornecedor';
      _log.error(message, e, s);
      Messages.alert(message);
    }
  }

  @action
  Future<void> _findSupplierServices() async {
    try {
      _supplierServices = await _supplierService.findServices(_supplierId);
    } catch (e, s) {
      const message = 'Erro ao buscar serviços do fornecedor';
      _log.error(message, e, s);
      Messages.alert(message);
    }
  }

  @action
  void addOrRemoveService(SupplierServicesModel supplierServicesModel) {
    if (_selectedServices.contains(supplierServicesModel)) {
      _selectedServices.remove(supplierServicesModel);
    } else {
      _selectedServices.add(supplierServicesModel);
    }
  }

  @action
  bool isServiceSelected(SupplierServicesModel service) => _selectedServices.contains(service);

  String get totalServicesSelected =>
      'Serviços (${_selectedServices.length} selecionado${_selectedServices.length > 1 ? 's' : ''})';

  Future<void> goToPhoneOrCopyPhoneToClipboard() async {
    final phoneUrl = 'tel:${_supplier?.phone}';

    if (await canLaunchUrlString(phoneUrl)) {
      await launchUrlString(phoneUrl);
    } else {
      await Clipboard.setData(ClipboardData(text: _supplier?.phone ?? ''));
      Messages.info('Telefone copiado para área de transferência');
    }
  }

  Future<void> goToGeoOrCopyAddressToClipboard() async {
    final geoUrl = 'geo:${_supplier?.lat}, ${_supplier?.lng}';

    if (await canLaunchUrlString(geoUrl)) {
      await launchUrlString(geoUrl);
    } else {
      await Clipboard.setData(ClipboardData(text: _supplier?.address ?? ''));
      Messages.info('Endereço copiado para área de transferência');
    }
  }
}
