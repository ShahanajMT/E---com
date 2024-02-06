// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    Key? key,
    this.height,
    this.width,
    this.radius = TSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.backgroudColor = TColors.white,
    this.borderColor = TColors.borderPrimary,
    this.padding,
    this.margin,
  }) : super(key: key);

  //---- required feids ---- //
  final double? height;
  final double? width;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color backgroudColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
