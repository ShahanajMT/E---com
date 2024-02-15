import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/success_screen/success_screen.dart';
import 'package:tstore/features/shop/screens/cart/widgets/cartItems.dart';
import 'package:tstore/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:tstore/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:tstore/navigation_bar_menu.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../common/styles/widgets/products/cart/TCouponCode.dart';
import 'widgets/billing_amount_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ---- Items into cart
              const ListOfCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBwSections),

              // ---- Coupon TextFeild
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBwSections),

              // ----- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroudColor: darkMode ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // ------ Pricing ------ //
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBwItems),

                    // ------ Divider ------ //
                    Divider(),
                    SizedBox(height: TSizes.spaceBwItems),
                    // ------ Payment Method ------ //
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBwItems),

                    // ------ Address ------ //
                    BillingAddressSection(),
                    SizedBox(height: TSizes.spaceBwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //! checkOut Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () =>  SuccessScreen(
                    image: TImages.success,
                    title: 'Paymen Success',
                    subTitle: 'Your item will be Shipped soon!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text('CheckOut \$234')),
      ),
    );
  }
}
