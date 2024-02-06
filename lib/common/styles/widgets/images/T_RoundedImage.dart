import 'package:flutter/material.dart';
import 'package:tstore/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';

class TRoundImage extends StatelessWidget {
  const TRoundImage({
    Key? key,
    this.height,
    this.width,
    required this.imageUrl,
    this.applayImageRadius = true,
    this.border,
    this.backgroudColor = TColors.light,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPresesd,
     this.borderRadius = TSizes.sm,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String imageUrl;
  final bool applayImageRadius;
  final BoxBorder? border;
  final Color? backgroudColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPresesd;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresesd,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroudColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
            borderRadius: applayImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
            )),
      ),
    );
  }
}