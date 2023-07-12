class PlaceModel {
  final String address;
  final double lat;
  final double lgn;

  PlaceModel({
    required this.address,
    required this.lat,
    required this.lgn,
  });

  @override
  String toString() => 'PlaceModel(address: $address, lat: $lat, lon: $lgn)';
}
