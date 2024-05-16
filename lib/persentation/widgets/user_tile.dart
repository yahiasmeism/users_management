import 'package:flutter/material.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/user_image.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    DateTime birthDate = user.birthDate;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: UserImage(user: user),
        title: Text(
          '${user.firstName} ${user.lastName} ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            '${user.gender}  ${user.age}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        trailing: Text(
          '${birthDate.year} / ${birthDate.month} / ${birthDate.day}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
