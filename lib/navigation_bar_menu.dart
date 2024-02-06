import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tstore/features/shop/screens/Home/home.dart';
import 'package:tstore/features/shop/screens/store/store.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    //! to get obj
    final controller = Get.put(NavigationController());

    final darkMode = THelperFunction.isDarkMode(context);
    
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
           NavigationDestination(icon:  Icon(Iconsax.home), label: 'Home'),
           NavigationDestination(icon:  Icon(Iconsax.shop), label: 'Store'),
           NavigationDestination(icon:  Icon(Iconsax.heart), label: 'Wishlist'),
           NavigationDestination(icon:  Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(color: Colors.yellow),
    Container(color: Colors.blue),
  ];
}
