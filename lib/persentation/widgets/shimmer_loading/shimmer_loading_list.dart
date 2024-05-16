import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Constants.PRIMARY_COLOR[50]!,
      highlightColor: Constants.PRIMARY_COLOR[200]!,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(12)),
            child: const ListTile(),
          );
        },
      ),
    );
  }
}
