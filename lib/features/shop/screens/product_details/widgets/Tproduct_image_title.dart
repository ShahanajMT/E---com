import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/styles/widgets/appBar/custom_appBar.dart';
import '../../../../../common/styles/widgets/custome_shapes/curved_edgets/TcurvedEdgetWidgets.dart';
import '../../../../../common/styles/widgets/icons/TCircularIcon.dart';
import '../../../../../common/styles/widgets/images/T_RoundedImage.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fn.dart';

class TProductImageTitle extends StatelessWidget {
  const TProductImageTitle({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        width: double.infinity,
        color: darkMode ? TColors.darkergrey : TColors.light,
        child: Stack(
          children: [
            //! main Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding:
                     EdgeInsets.all(TSizes.productImageradius * 2),
                child: Center(
                  child: Image(
                    //fit: BoxFit.contain,
                    image: AssetImage(TImages.productImage1),
                  ),
                ),
              ),
            ),
            //! image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: TSizes.spaceBwItems);
                  },
                  itemBuilder: (_, index) {
                    return TRoundImage(
                      height: 80,
                      backgroudColor:
                          darkMode ? TColors.dark : TColors.light,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imageUrl: TImages.productImage1,
                    );
                  },
                ),
              ),
            ),

            //! appBar
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}