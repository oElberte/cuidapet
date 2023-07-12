class PlaceModel {
  final String address;
  final double lat;
  final double lng;

  PlaceModel({
    required this.address,
    required this.lat,
    required this.lng,
  });

  @override
  String toString() => 'PlaceModel(address: $address, lat: $lat, lon: $lng)';
}
