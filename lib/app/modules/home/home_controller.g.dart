// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_addressEntityAtom =
      Atom(name: 'HomeControllerBase._addressEntity', context: context);

  AddressEntity? get addressEntity {
    _$_addressEntityAtom.reportRead();
    return super._addressEntity;
  }

  @override
  AddressEntity? get _addressEntity => addressEntity;

  @override
  set _addressEntity(AddressEntity? value) {
    _$_addressEntityAtom.reportWrite(value, super._addressEntity, () {
      super._addressEntity = value;
    });
  }

  late final _$_categoriesAtom =
      Atom(name: 'HomeControllerBase._categories', context: context);

  List<SupplierCategoryModel> get categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  List<SupplierCategoryModel> get _categories => categories;

  @override
  set _categories(List<SupplierCategoryModel> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$_supplierPageTypeSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierPageTypeSelected', context: context);

  SupplierPageType get supplierPageTypeSelected {
    _$_supplierPageTypeSelectedAtom.reportRead();
    return super._supplierPageTypeSelected;
  }

  @override
  SupplierPageType get _supplierPageTypeSelected => supplierPageTypeSelected;

  @override
  set _supplierPageTypeSelected(SupplierPageType value) {
    _$_supplierPageTypeSelectedAtom
        .reportWrite(value, super._supplierPageTypeSelected, () {
      super._supplierPageTypeSelected = value;
    });
  }

  late final _$_listSuppliersByAddressAtom = Atom(
      name: 'HomeControllerBase._listSuppliersByAddress', context: context);

  List<SupplierNearByMeModel> get listSuppliersByAddress {
    _$_listSuppliersByAddressAtom.reportRead();
    return super._listSuppliersByAddress;
  }

  @override
  List<SupplierNearByMeModel> get _listSuppliersByAddress =>
      listSuppliersByAddress;

  @override
  set _listSuppliersByAddress(List<SupplierNearByMeModel> value) {
    _$_listSuppliersByAddressAtom
        .reportWrite(value, super._listSuppliersByAddress, () {
      super._listSuppliersByAddress = value;
    });
  }

  late final _$_listSuppliersByAddressCacheAtom = Atom(
      name: 'HomeControllerBase._listSuppliersByAddressCache',
      context: context);

  List<SupplierNearByMeModel> get listSuppliersByAddressCache {
    _$_listSuppliersByAddressCacheAtom.reportRead();
    return super._listSuppliersByAddressCache;
  }

  @override
  List<SupplierNearByMeModel> get _listSuppliersByAddressCache =>
      listSuppliersByAddressCache;

  @override
  set _listSuppliersByAddressCache(List<SupplierNearByMeModel> value) {
    _$_listSuppliersByAddressCacheAtom
        .reportWrite(value, super._listSuppliersByAddressCache, () {
      super._listSuppliersByAddressCache = value;
    });
  }

  late final _$_nameSearchTextAtom =
      Atom(name: 'HomeControllerBase._nameSearchText', context: context);

  String get nameSearchText {
    _$_nameSearchTextAtom.reportRead();
    return super._nameSearchText;
  }

  @override
  String get _nameSearchText => nameSearchText;

  @override
  set _nameSearchText(String value) {
    _$_nameSearchTextAtom.reportWrite(value, super._nameSearchText, () {
      super._nameSearchText = value;
    });
  }

  late final _$_supplierCategoryFilterSelectedAtom = Atom(
      name: 'HomeControllerBase._supplierCategoryFilterSelected',
      context: context);

  SupplierCategoryModel? get supplierCategoryFilterSelected {
    _$_supplierCategoryFilterSelectedAtom.reportRead();
    return super._supplierCategoryFilterSelected;
  }

  @override
  SupplierCategoryModel? get _supplierCategoryFilterSelected =>
      supplierCategoryFilterSelected;

  @override
  set _supplierCategoryFilterSelected(SupplierCategoryModel? value) {
    _$_supplierCategoryFilterSelectedAtom
        .reportWrite(value, super._supplierCategoryFilterSelected, () {
      super._supplierCategoryFilterSelected = value;
    });
  }

  late final _$_getAddressSelectedAsyncAction =
      AsyncAction('HomeControllerBase._getAddressSelected', context: context);

  @override
  Future<void> _getAddressSelected() {
    return _$_getAddressSelectedAsyncAction
        .run(() => super._getAddressSelected());
  }

  late final _$goToAddressPageAsyncAction =
      AsyncAction('HomeControllerBase.goToAddressPage', context: context);

  @override
  Future<void> goToAddressPage() {
    return _$goToAddressPageAsyncAction.run(() => super.goToAddressPage());
  }

  late final _$_getCategoriesAsyncAction =
      AsyncAction('HomeControllerBase._getCategories', context: context);

  @override
  Future<void> _getCategories() {
    return _$_getCategoriesAsyncAction.run(() => super._getCategories());
  }

  late final _$_getNearByAsyncAction =
      AsyncAction('HomeControllerBase._getNearBy', context: context);

  @override
  Future<void> _getNearBy() {
    return _$_getNearByAsyncAction.run(() => super._getNearBy());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void filterSupplierCategory(SupplierCategoryModel category) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSupplierCategory');
    try {
      return super.filterSupplierCategory(category);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterSupplierByName(String name) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.filterSupplierByName');
    try {
      return super.filterSupplierByName(name);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _filterSupplier() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase._filterSupplier');
    try {
      return super._filterSupplier();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageType(SupplierPageType supplierPageType) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changePageType');
    try {
      return super.changePageType(supplierPageType);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
