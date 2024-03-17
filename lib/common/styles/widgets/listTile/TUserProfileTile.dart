// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';
import 'package:tstore/features/personalisation/controllers/user_controller.dart';
import 'package:tstore/features/personalisation/screens/profile/profile.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class TProfileTile extends StatelessWidget {
  const TProfileTile({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)), 
      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: TColors.white,)),               );
  }
}
