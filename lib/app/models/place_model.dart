
class PlaceModel {
  final String address;
  final double lat;
  final double lon;
  
  PlaceModel({
    required this.address,
    required this.lat,
    required this.lon,
  });

  @override
  String toString() => 'PlaceModel(address: $address, lat: $lat, lon: $lon)';
}
