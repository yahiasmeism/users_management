import 'package:flutter/material.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/user_tile.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key, required this.users});
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
        indent: 105,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(user: users[index]);
      },
    );
  }
}
