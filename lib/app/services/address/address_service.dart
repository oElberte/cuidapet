import '../../entities/address_entity.dart';
import '../../models/place_model.dart';

abstract class AddressService {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
  Future<List<AddressEntity>> getAddress();
  Future<AddressEntity> saveAddress(PlaceModel placeModel, String additional);
  Future<void> deleteAll();
  Future<void> selectAddress(AddressEntity addressEntity);
  Future<AddressEntity?> getAddressSelected();
}
