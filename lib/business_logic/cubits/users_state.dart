// import '../../data/models/user_model.dart';

abstract class UsersState {}

class InitialUsersState extends UsersState {}

class LoadingUsersState extends UsersState {}

class LoadedUsersState extends UsersState {}

class FailureUsersState extends UsersState {}

class OnFilterUsersState extends UsersState {}
