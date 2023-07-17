import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
import '../../core/ui/widgets/loader.dart';
import '../../core/ui/widgets/messages.dart';
import '../../entities/address_entity.dart';
import '../../models/supplier_category_model.dart';
import '../../models/supplier_near_by_me_model.dart';
import '../../services/address/address_service.dart';
import '../../services/supplier/supplier_service.dart';

part 'home_controller.g.dart';

enum SupplierPageType {
  list,
  grid,
}

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  @readonly
  AddressEntity? _addressEntity;

  @readonly
  var _categories = <SupplierCategoryModel>[];

  @readonly
  var _supplierPageTypeSelected = SupplierPageType.list;

  @readonly
  var _listSuppliersByAddress = <SupplierNearByMeModel>[];

  @readonly
  var _listSuppliersByAddressCache = <SupplierNearByMeModel>[];

  @readonly
  var _nameSearchText = '';

  @readonly
  SupplierCategoryModel? _supplierCategoryFilterSelected;

  late ReactionDisposer nearByReactionDisposer;

  HomeControllerBase({
    required AddressService addressService,
    required SupplierService supplierService,
  })  : _addressService = addressService,
        _supplierService = supplierService;

  @override
  void onInit([Map<String, dynamic>? params]) {
    nearByReactionDisposer = reaction((_) => _addressEntity, (address) {
      _getNearBy();
    });
  }

  @override
  Future<void> onReady() async {
    try {
      Loader.show();
      await _getAddressSelected();
      await _getCategories();
    } finally {
      Loader.hide();
    }
  }

  @override
  void dispose() {
    nearByReactionDisposer();
  }

  @action
  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();

    if (_addressEntity == null) {
      await goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>('/address/');

    if (address != null) {
      _addressEntity = address;
    }
  }

  @action
  Future<void> _getCategories() async {
    try {
      final categories = await _supplierService.getCategories();
      _categories = [...categories];
    } catch (e) {
      Messages.alert('Erro ao buscar as categorias');
      throw Exception();
    }
  }

  @action
  Future<void> _getNearBy() async {
    try {
      if (_addressEntity != null) {
        final suppliers = await _supplierService.findNearBy(_addressEntity!);
        _listSuppliersByAddress = [...suppliers];
        _listSuppliersByAddressCache = [...suppliers];
        _filterSupplier();
      } else {
        Messages.alert('Para realizar a busca por petshops, você precisa selecionar um endereço');
      }
    } catch (e) {
      Messages.alert('Erro ao buscar as petshops');
      throw Exception();
    }
  }

  @action
  void filterSupplierCategory(SupplierCategoryModel category) {
    if (_supplierCategoryFilterSelected == category) {
      _supplierCategoryFilterSelected = null;
    } else {
      _supplierCategoryFilterSelected = category;
    }
    _filterSupplier();
  }

  @action
  void filterSupplierByName(String name) {
    _nameSearchText = name;
    _filterSupplier();
  }

  @action
  void _filterSupplier() {
    var suppliers = [..._listSuppliersByAddressCache];

    if (_supplierCategoryFilterSelected != null) {
      suppliers = suppliers
          .where(
            (supplier) => supplier.category == _supplierCategoryFilterSelected?.id,
          )
          .toList();
    }

    if (_nameSearchText.isNotEmpty) {
      suppliers = suppliers
          .where(
            (supplier) => supplier.name.toLowerCase().contains(_nameSearchText.toLowerCase()),
          )
          .toList();
    }

    _listSuppliersByAddress = [...suppliers];
  }

  @action
  void changePageType(SupplierPageType supplierPageType) {
    _supplierPageTypeSelected = supplierPageType;
  }
}
