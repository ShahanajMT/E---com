import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/features/personalisation/controllers/user_controller.dart';
import 'package:tstore/utils/TShimmer_effect.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../../common/styles/widgets/appBar/custom_appBar.dart';
import '../../../../../common/styles/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final darkMode = THelperFunction.isDarkMode(context);
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: darkMode ? TColors.darkergrey : TColors.grey),),
          Obx(()
           {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15,);
            } else {
              final fullName = controller.user.value.userName;
             // final fullName = controller.user.value.fullName ?? 'Unknown';
              log('User fullname : $fullName');
              return Text(fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: darkMode? TColors.white : TColors.black),);
            }
            
            }),
        ],
      ),
      actions: [
        TCartCouterIcon(onPressed: () {}, iconColor: TColors.white,)
      ],
    );
  }
}
