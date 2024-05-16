import 'package:hive/hive.dart';

import 'address_model.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final int age;
  @HiveField(4)
  final String gender;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String phone;
  @HiveField(7)
  final DateTime birthDate;
  @HiveField(8)
  final String image;
  @HiveField(9)
  final AddressModel address;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.email,
      required this.phone,
      required this.birthDate,
      required this.image,
      required this.address});

  factory UserModel.fromMap(jsonData) {
    return UserModel(
      id: jsonData['id'],
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      age: jsonData['age'],
      gender: jsonData['gender'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      birthDate: DateTime.parse(jsonData['birthDate']),
      image: jsonData['image'] ?? '',
      address: AddressModel.fromJson(
        jsonData['address'],
      ),
    );
  }

  @override
  String toString() {
    return "firstName: $firstName , city: ${address.city} , coordinates: ${address.coordinates.lng}\n";
  }
}
