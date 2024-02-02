import 'package:flutter/material.dart';

import '../../../../../common/styles/widgets/appBar/custom_appBar.dart';
import '../../../../../common/styles/widgets/products/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text(TTexts.homeAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
        ],
      ),
      actions: [
        TCartCouterIcon(onPressed: () {}, iconColor: TColors.white,)
      ],
    );
  }
}
