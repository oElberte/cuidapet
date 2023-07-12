import 'package:mobx/mobx.dart';

import '../../../core/ui/widgets/loader.dart';
import '../../../entities/address_entity.dart';
import '../../../models/place_model.dart';
import '../../../services/address/address_service.dart';

part 'address_details_controller.g.dart';

class AddressDetailsController = AddressDetailsControllerBase with _$AddressDetailsController;

abstract class AddressDetailsControllerBase with Store {
  final AddressService _addressService;

  @readonly
  AddressEntity? _addressEntity;

  AddressDetailsControllerBase({
    required AddressService addressService,
  }) : _addressService = addressService;

  Future<void> saveAddress(PlaceModel placeModel, String additional) async {
    Loader.show();
    final addressEntity = await _addressService.saveAddress(placeModel, additional);
    Loader.hide();
    _addressEntity = addressEntity;
  }
}
