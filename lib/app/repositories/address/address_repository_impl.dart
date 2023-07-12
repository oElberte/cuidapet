import 'package:google_places/google_places.dart';

import '../../core/exceptions/failure.dart';
import '../../core/helpers/constants.dart';
import '../../core/helpers/environments.dart';
import '../../models/place_model.dart';
import './address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  @override
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern) async {
    final googleApiKey = Environments.param(Constants.ENV_GOOGLE_API_KEY);

    if (googleApiKey == null) {
      throw Failure(message: 'Google API Key not found');
    }

    final googlePlace = GooglePlaces(googleApiKey);
    final addressResult = await googlePlace.search.getTextSearch(addressPattern);
    final candidates = addressResult?.results;

    if (candidates != null) {
      return candidates.map<PlaceModel>((searchResult) {
        final location = searchResult.geometry?.location;
        final address = searchResult.formattedAddress;

        return PlaceModel(
          address: address ?? '',
          lat: location?.lat ?? 0,
          lgn: location?.lng ?? 0,
        );
      }).toList();
    }

    return <PlaceModel>[];
  }
}
