import 'package:flutter/material.dart';
import 'package:user_management/data/models/user_model.dart';
import 'package:user_management/persentation/widgets/user_image.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    DateTime birthDate = user.birthDate;
    return ListTile(
      contentPadding: const EdgeInsets.all(4),
      leading: UserImage(user: user),
      title: Text(
        '${user.firstName} ${user.lastName} ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          '${user.gender}  ${user.age}',
        ),
      ),
      trailing:
          Text('${birthDate.year} / ${birthDate.month} / ${birthDate.day}'),
    );
  }
}
// // }
// class UserTile extends StatelessWidget {
//   const UserTile({super.key, required this.user});
//   final UserModel user;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       margin: const EdgeInsets.all(5),
//       height: 70,
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: UserImage(user: user),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${user.firstName} ${user.lastName}",
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Text("${user.gender}  ${user.age}"),
//                   ],
//                 )
//               ],
//             ),
//           ),
         
//         ],
//       ),
//     );
//   }
// }
