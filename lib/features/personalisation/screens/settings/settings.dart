import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TPrimaryHeaderContainer.dart';
import 'package:tstore/common/styles/widgets/listTile/TSettingsMenu.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/authentication/screens/login/loginPage.dart';
import 'package:tstore/features/personalisation/screens/address/address.dart';
import 'package:tstore/features/personalisation/screens/profile/profile.dart';
import 'package:tstore/features/shop/screens/order/order.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';

import '../../../../common/styles/widgets/listTile/TUserProfileTile.dart';

class SettingScreens extends StatelessWidget {
  const SettingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //! ---- Header ----!//
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                // ---- APP BAR
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                  actions: [
                    IconButton(onPressed: () => Get.offAll(() => const LogInPage()), icon: const Icon(Iconsax.logout_1, size: 30, color: TColors.white,),)
                  ],
                ),

                // ---- User Profile Card
                 TProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                 const SizedBox(height: TSizes.spaceBwSections),
                 Text("Hai"),
              ],
            
            ),
            
          ),
          //! ---- Body ----!//
            Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // --- Account Settings
                const TSectionHeading(title: 'Account Settings',showActionButton: false,),
                 const SizedBox(height: TSizes.spaceBwItems),
                  TSettingsMenu(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping devlivery address', onTap: () => Get.to(() => const UserAddressScreen()),),
                 const TSettingsMenu(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
                  TSettingsMenu(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In - progress and Complete Orders', onTap: () => Get.to(() => const OrderScreen())),
                 const TSettingsMenu(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to register bank account'),
                 const TSettingsMenu(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discount coupons'),
                 const TSettingsMenu(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message'),
                 const TSettingsMenu(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connect account'),

                 //---- App Settings

                 const SizedBox(height: TSizes.spaceBwItems),
                 const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwItems),
                  const TSettingsMenu(icon: Iconsax.document, title: 'Load Data', subTitle: 'Upload data your cloud'),
                  TSettingsMenu(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Set recomentation based on location', trailing: Switch(value: true, onChanged: (values) {},)),
                  TSettingsMenu(icon: Iconsax.security_user, title: 'Safe Mode', subTitle: 'Search result is safe for all ages', trailing: Switch(value: false, onChanged: (values) {},)),
                  TSettingsMenu(icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Set image quality to be seen', trailing: Switch(value: false, onChanged: (values) {},)),

                 
              ],
            ),
          )
        ],
      ),
    );
  }
}
