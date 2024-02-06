
import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/search_container.dart';
import 'package:tstore/common/styles/widgets/layout/TGridlayout.dart';
import 'package:tstore/common/styles/widgets/products/cart/cart_menu_icon.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/common/styles/widgets/texts/t_brandIconTextWithVerifiedIcon.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/enums.dart';
import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../common/styles/widgets/images/T_CircularImage.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCouterIcon(
              onPressed: () {},
            ),
          ],
        ),

        // --- Body ---- //
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: darkMode ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //! --- Search Bar --- //
                      const SizedBox(height: TSizes.spaceBwItems),
                      const TSearchController(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBwSections),

                      //! ---- Feature Brands ---- !//
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBwItems / 1.5),

                      // ---Rounded Container --- //
                      TGridLayout(itemCount: 4, mainAxisExtent: 80,itemBuilder: (_, index) {
                        return InkWell(
                        onTap: () {},
                        child: TRoundedContainer(
                          padding: const EdgeInsets.all(TSizes.sm),
                          showBorder: true,
                          backgroudColor: Colors.transparent,
                          child: Row(
                            children: [
                              Flexible(
                                child: TCircularImage(
                                  isNetworkImage: false,
                                  backgroudColor: Colors.transparent,
                                  image: TImages.clothIcon,
                                  overlayColor: THelperFunction.isDarkMode(context)
                                      ? TColors.white
                                      : TColors.black,
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBwItems / 2),
                              // -- text
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.large),
                                    Text('255 Products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                      },)
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}
