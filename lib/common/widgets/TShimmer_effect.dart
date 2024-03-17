import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;

  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
     this.radius = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: darkMode ? Colors.grey[850]! : Colors.grey[350]!,
      highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: darkMode ? TColors.grey : TColors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
