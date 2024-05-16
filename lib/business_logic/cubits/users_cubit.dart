import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_management/business_logic/cubits/users_state.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/data/hive/hive_service.dart';
import 'package:user_management/data/web_service/users_api.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(InitialUsersState());
  List<UserModel> users = [];
  List<UserModel> usersFilter = [];

  // get data to List Of users
  Future<void> fetchUsersFromApi() async {
    try {
      // loading data
      emit(LoadingUsersState());

      // get internat status
      final hasConnected = await InternetConnectionChecker().hasConnection;

      // check intenet status
      if (hasConnected) {
        // fetch users from api
        users = await UsersApi.getUsers();

        // Store users with profile image in Local
        for (var user in users) {
          await HiveService.storeUsers(user: user);
        }

        // Send loaded status
        emit(LoadedUsersState());
      } else {
        // If the Internet is not available
        users = await HiveService.getAllUsers();

        // Send loaded status
        emit(LoadedUsersState());
      }
    } on Exception catch (_) {
      emit(FailureUsersState());
    }
  }

  loadedUsers() {
    emit(LoadedUsersState());
  }

  filter({int? age, String? gender, int? birthYear}) {
    if (age != null) {
      usersFilter = usersFilter.where((user) => user.age == age).toList();
    }
    if (gender != null) {
      usersFilter = usersFilter
          .where((user) => user.gender.toString() == gender.toLowerCase())
          .toList();
    }
    if (birthYear != null) {
      usersFilter = usersFilter
          .where((user) => user.birthDate.year == birthYear)
          .toList();
    }
    if (usersFilter.isNotEmpty) {
      emit(OnFilterUsersState());
    } else {
      emit(LoadedUsersState());
    }
  }

  search(String query) {
    // Exucute Query from All User
    usersFilter = users.where((user) {
      // convert all variables to lower case
      query = query.toLowerCase();
      final firstName = user.firstName.toLowerCase();
      final lastName = user.lastName.toLowerCase();

      // filter user with first name or last name
      return firstName.startsWith(query) |
          lastName.startsWith(query) |
          ('$firstName $lastName').startsWith(query);
    }).toList();
  }
}
