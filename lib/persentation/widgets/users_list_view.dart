import 'package:flutter/material.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/user_tile.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key, required this.users});
  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          indent: 90,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserTile(user: users[index]);
        },
      ),
    );
  }
}
