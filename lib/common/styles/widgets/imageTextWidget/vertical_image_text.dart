import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/TShimmer_effect.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fn.dart';

class TVerticalTextImage extends StatelessWidget {
  const TVerticalTextImage({
    Key? key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroudColor,
    this.isNetworkImage = true,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroudColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TCircularImage(backgroudColor: backgroudColor, image: image, width: 56, height: 56, padding: TSizes.sm * 1.4, isNetworkImage: isNetworkImage),

            // text
            const SizedBox(height: TSizes.spaceBwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.backgroudColor,
    // required this.darkMode,
    required this.image,
    required this.width,
    required this.height,
    required this.padding,
    this.fit,
    required this.isNetworkImage,
    this.overlayColor,
  });

  final double width, height, padding;
  final Color? backgroudColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor;
  // final bool darkMode;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroudColor ??
              (THelperFunction.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          //color: TColors.dark,
          // border: Border.all(color: darkMode ? TColors.light : TColors.dark),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const TShimmerEffect(width: 55, height: 55, radius: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
