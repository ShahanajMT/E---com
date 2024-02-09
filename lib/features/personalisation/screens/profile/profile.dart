import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/personalisation/screens/profile/Widgets/TProfileMenu.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            TProfileMenu(title: 'Name', value: 'Shahanajshanu', onPressed: (){},),
            TProfileMenu(title: 'Username', value: '___Shahanajshanu', onPressed: (){},),

             const SizedBox(height: TSizes.spaceBwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBwItems),
            // --- Heading to Personal Info
            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems),

            TProfileMenu(title: 'UserID', value: '114456', onPressed: (){}, icon: Iconsax.copy,),
            TProfileMenu(title: 'Email', value: 'shahanaj@gmail.com', onPressed: (){},),
            TProfileMenu(title: 'Phone No', value: '9061252930', onPressed: (){},),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
            TProfileMenu(title: 'Date Of Birth', value: '17 - 09 - 2000', onPressed: (){},),

            const Divider(),
            const SizedBox(height: TSizes.spaceBwItems),
            Center(child: TextButton(onPressed: () {}, child: Text('Close Account', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.red),)),)
          ],
          
        ),
      )),
    );
  }
}


