import 'package:dio/dio.dart';
import 'package:user_management/constants/constants.dart';
import 'package:user_management/data/models/user_model.dart';

class UsersApi {
  static final Dio dio = Dio();

  static Future<List<UserModel>> getUsers() async {
    final response = await dio.get(Constants.USER_API);
    if (response.statusCode != 200) {
      throw Exception('Something went wrong. Try again later');
    }

    List<dynamic> json = response.data['users'];
    List<UserModel> users = json
        .map(
          (e) => UserModel.fromMap(
            Map<String, dynamic>.from(e as Map<String, dynamic>),
          ),
        )
        .toList();

    return users;
  }
}
