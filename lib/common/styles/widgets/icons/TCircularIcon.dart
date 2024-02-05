// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../utils/constants/colors.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    Key? key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroudColor,
    this.onPressed,
    //required this.darkMode,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? backgroudColor;
  final VoidCallback? onPressed; 



  //final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroudColor != null ? backgroudColor! : darkMode ? TColors.black.withOpacity(0.9) : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, size: size, color: color),  ),
    );
  }
}
