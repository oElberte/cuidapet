import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
import '../../core/ui/widgets/loader.dart';
import '../../entities/address_entity.dart';
import '../../services/address/address_service.dart';

part 'address_controller.g.dart';

class AddressController = AddressControllerBase with _$AddressController;

abstract class AddressControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;

  @readonly
  List<AddressEntity> _addresses = [];

  AddressControllerBase({
    required AddressService addressService,
  }) : _addressService = addressService;

  @override
  void onReady() {
    getAddresses();
  }

  @action
  Future<void> getAddresses() async {
    Loader.show();
    _addresses = await _addressService.getAddress();
    Loader.hide();
  }
}
