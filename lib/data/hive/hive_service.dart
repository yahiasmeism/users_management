import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_management/constants/constants.dart';
import 'package:user_management/data/models/address_model.dart';
import 'package:user_management/data/models/coordinates_model.dart';
import 'package:user_management/data/models/user_model.dart';

class HiveService {
  static init() async {
    await Hive.initFlutter();
    // // register posts in hive db
    Hive.registerAdapter(UserModelAdapter());
    // // register addresses in hive db
    Hive.registerAdapter(AddressModelAdapter());
    // // register Coordinates in hive db
    Hive.registerAdapter(CoordinatesModelAdapter());
  }

  static Future<List<UserModel>> getAllUsers() async {
    Box<UserModel> usersBox = await Hive.openBox(Constants.USERS_BOX);
    // get all users from box
    final localUsers = usersBox.values.toList();
    return localUsers;
  }

  static Future<void> storeUsers({required UserModel user}) async {
    Box<UserModel> usersBox = await Hive.openBox(Constants.USERS_BOX);
    // store new data
    await usersBox.put(user.id, user);
  }
}
