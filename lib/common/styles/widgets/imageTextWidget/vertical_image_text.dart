import 'package:flutter/material.dart';

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
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroudColor;
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
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroudColor ?? (darkMode ? TColors.black : TColors.white),
                  //color: TColors.dark,
                  border: Border.all(color: darkMode ? TColors.light : TColors.dark),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: darkMode ? TColors.light : TColors.dark,
                ),
              ),
            ),

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