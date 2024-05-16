import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Constants.PRIMARY_COLOR[50]!,
      highlightColor: Constants.PRIMARY_COLOR[100]!,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 3,
            // color: Colors.black,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Constants.PRIMARY_COLOR,
              ),
              child: const ListTile(),
            );
          },
        ),
      ),
    );
  }
}
