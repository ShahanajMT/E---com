import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../utils/constants/colors.dart';

class TCartCouterIcon extends StatelessWidget {
  const TCartCouterIcon({
    Key? key,
     this.iconColor,
     this.onPressed,
  }) : super(key: key);

  final Color? iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon:  Icon(Iconsax.shopping_bag, color: darkMode ? TColors.white : TColors.black)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: darkMode ? TColors.light : TColors.dark),
            child: Center(child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: darkMode ? TColors.black : TColors.white),),),
          ),
        ),
      ],
    );
  }
}
