// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupplierController on SupplierControllerBase, Store {
  late final _$_supplierAtom =
      Atom(name: 'SupplierControllerBase._supplier', context: context);

  SupplierModel? get supplier {
    _$_supplierAtom.reportRead();
    return super._supplier;
  }

  @override
  SupplierModel? get _supplier => supplier;

  @override
  set _supplier(SupplierModel? value) {
    _$_supplierAtom.reportWrite(value, super._supplier, () {
      super._supplier = value;
    });
  }

  late final _$_supplierServicesAtom =
      Atom(name: 'SupplierControllerBase._supplierServices', context: context);

  List<SupplierServicesModel> get supplierServices {
    _$_supplierServicesAtom.reportRead();
    return super._supplierServices;
  }

  @override
  List<SupplierServicesModel> get _supplierServices => supplierServices;

  @override
  set _supplierServices(List<SupplierServicesModel> value) {
    _$_supplierServicesAtom.reportWrite(value, super._supplierServices, () {
      super._supplierServices = value;
    });
  }

  late final _$_selectedServicesAtom =
      Atom(name: 'SupplierControllerBase._selectedServices', context: context);

  ObservableList<SupplierServicesModel> get selectedServices {
    _$_selectedServicesAtom.reportRead();
    return super._selectedServices;
  }

  @override
  ObservableList<SupplierServicesModel> get _selectedServices =>
      selectedServices;

  @override
  set _selectedServices(ObservableList<SupplierServicesModel> value) {
    _$_selectedServicesAtom.reportWrite(value, super._selectedServices, () {
      super._selectedServices = value;
    });
  }

  late final _$_findSupplierByIdAsyncAction =
      AsyncAction('SupplierControllerBase._findSupplierById', context: context);

  @override
  Future<void> _findSupplierById() {
    return _$_findSupplierByIdAsyncAction.run(() => super._findSupplierById());
  }

  late final _$_findSupplierServicesAsyncAction = AsyncAction(
      'SupplierControllerBase._findSupplierServices',
      context: context);

  @override
  Future<void> _findSupplierServices() {
    return _$_findSupplierServicesAsyncAction
        .run(() => super._findSupplierServices());
  }

  late final _$SupplierControllerBaseActionController =
      ActionController(name: 'SupplierControllerBase', context: context);

  @override
  void addOrRemoveService(SupplierServicesModel supplierServicesModel) {
    final _$actionInfo = _$SupplierControllerBaseActionController.startAction(
        name: 'SupplierControllerBase.addOrRemoveService');
    try {
      return super.addOrRemoveService(supplierServicesModel);
    } finally {
      _$SupplierControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isServiceSelected(SupplierServicesModel service) {
    final _$actionInfo = _$SupplierControllerBaseActionController.startAction(
        name: 'SupplierControllerBase.isServiceSelected');
    try {
      return super.isServiceSelected(service);
    } finally {
      _$SupplierControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
