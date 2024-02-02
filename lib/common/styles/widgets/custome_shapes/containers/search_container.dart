import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../../../utils/helpers/helper_fn.dart';

class TSearchController extends StatelessWidget {
  const TSearchController({
    Key? key,
    required this.text,
    this.icon = Iconsax.search_normal,
     this.showBackground = true,
     this.showBorder = true,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? darkMode ? TColors.dark : TColors.white : Colors.transparent,
            borderRadius:
                BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder? Border.all(color: TColors.grey) : null),
            child: Row(
              children: [
                 Icon(icon, color: TColors.darkergrey),
                const  SizedBox(width: TSizes.spaceBwItems),
                Text(text, style: Theme.of(context).textTheme.bodySmall),

              ],
            ),
      ),
      
    );
  }
}