// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../widgets/TShimmer_effect.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    Key? key,
    this.height = 56,
    this.width = 56,
    this.padding = TSizes.sm,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroudColor,
  }) : super(key: key);

  //---
  final double height;
  final double width;
  final double padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroudColor;

  @override
  Widget build(BuildContext context) {
    //final darkMode = THelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage
          ? CachedNetworkImage(
              imageUrl: image,
              fit: fit,
              color: overlayColor,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const TShimmerEffect(width: 55, height: 55),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
              color: overlayColor),
    );
  }
}
