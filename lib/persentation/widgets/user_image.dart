import 'package:flutter/material.dart';
import 'package:user_management/constants/constants.dart';
import 'package:user_management/data/helper/Image_cache_manager.dart';
import 'package:user_management/data/models/user_model.dart';

import 'shimmer_loading/shimmer_loading_image.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Constants.PRIMARY_COLOR[100],
      child: FutureBuilder(
        future: ImageCacheManager.getImagePath(user.image),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final imagePath = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.file(imagePath),
            );
          } else if (snapshot.hasError) {
            return const Icon(Icons.person);
          } else {
            return const ShimmerLoadingImage();
          }
        },
      ),
    );
  }
}
