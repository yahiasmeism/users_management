import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_management/constants/constants.dart';

class ShimmerLoadingImage extends StatelessWidget {
  const ShimmerLoadingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Constants.PRIMARY_COLOR[50]!,
      highlightColor: Constants.PRIMARY_COLOR[200]!,
      child: const CircleAvatar(
        radius: 30,
      ),
    );
  }
}
