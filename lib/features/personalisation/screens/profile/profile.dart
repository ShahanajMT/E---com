import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/common/widgets/change_name.dart';
import 'package:tstore/features/personalisation/controllers/user_controller.dart';
import 'package:tstore/features/personalisation/screens/profile/Widgets/TProfileMenu.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true),

      // --- Body
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // --- Profile
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(
                      image: TImages.user, height: 80, width: 80),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change profile picture'),
                  ),
                ],
              ),
            ),
            // Details
            const SizedBox(height: TSizes.spaceBwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBwItems),

             // --- Heading to Profile Info
            const TSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems),

            TProfileMenu(title: 'Name', value: controller.user.value.email, onPressed: (){},),
            TProfileMenu(title: 'Username', value: controller.user.value.fullName, onPressed: () => Get.to(() => const Changename()),),

             const SizedBox(height: TSizes.spaceBwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBwItems),
            // --- Heading to Personal Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems),

            TProfileMenu(title: 'UserID', value: controller.user.value.id, onPressed: (){}, icon: Iconsax.copy,),
            TProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: (){},),
            TProfileMenu(title: 'Phone No', value: controller.user.value.phoneNumber, onPressed: (){},),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
            TProfileMenu(title: 'Date Of Birth', value: '17 - 09 - 2000', onPressed: (){},),

            const Divider(),
            const SizedBox(height: TSizes.spaceBwItems),
            Center(child: TextButton(onPressed: () => controller.deleteAccountWarningPopUp(), child: Text('Close Account', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.red),)),)
          ],
          
        ),
      )),
    );
  }
}


