import 'package:hive/hive.dart';

import 'coordinates_model.dart';
part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel extends HiveObject {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final CoordinatesModel coordinates;

  @HiveField(3)
  final String postalCode;

  @HiveField(4)
  final String state;

  AddressModel({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  factory AddressModel.fromJson(jsonData) {
    return AddressModel(
      address: jsonData['address'],
      city: jsonData['city'],
      coordinates: CoordinatesModel.fromJson(jsonData['coordinates']),
      postalCode: jsonData['postalCode'],
      state: jsonData['state'],
    );
  }
}
