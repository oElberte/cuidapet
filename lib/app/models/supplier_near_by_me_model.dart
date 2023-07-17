import 'dart:convert';


class SupplierNearByMeModel {
  final int id;
  final String name;
  final String logo;
  final double distance;
  final int category;

  SupplierNearByMeModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.distance,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'distance': distance,
      'category': category,
    };
  }

  factory SupplierNearByMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearByMeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      distance: map['distance']?.toDouble() ?? 0.0,
      category: map['category']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearByMeModel.fromJson(String source) => SupplierNearByMeModel.fromMap(json.decode(source));
}
