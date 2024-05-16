import 'package:hive/hive.dart';

part 'coordinates_model.g.dart';

@HiveType(typeId: 2)
class CoordinatesModel {
  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lng;

  CoordinatesModel({required this.lat, required this.lng});

  factory CoordinatesModel.fromJson(jsonData) {
    return CoordinatesModel(lat: jsonData['lat'], lng: jsonData['lng']);
  }
}
