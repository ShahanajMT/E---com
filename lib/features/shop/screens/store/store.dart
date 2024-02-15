// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tstore/common/styles/widgets/appBar/custom_appBar.dart';
import 'package:tstore/common/styles/widgets/appBar/tabBar.dart';

import 'package:tstore/common/styles/widgets/custome_shapes/containers/search_container.dart';
import 'package:tstore/common/styles/widgets/layout/TGridlayout.dart';
import 'package:tstore/common/styles/widgets/products/cart/cart_menu_icon.dart';
import 'package:tstore/common/styles/widgets/texts/section_heading.dart';
import 'package:tstore/features/shop/screens/brands/all_brands.dart';

import 'package:tstore/features/shop/screens/store/widgets/category_tab.dart';
import 'package:tstore/utils/constants/colors.dart';

import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

import '../../../../common/styles/widgets/brand/TBrandCard.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: TAppBar(
            title: Text('Store',
                style: Theme.of(context).textTheme.headlineMedium),
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
                            onPressed: () => Get.to(() => const AllBrands()),
                          ),
                          const SizedBox(height: TSizes.spaceBwItems / 1.5),

                          // ---Rounded Container --- //
                          TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const TBrandCard(
                                showBorder: false,
                              );
                            },
                          )
                        ],
                      ),
                    ),

                    //! TabBar
                    bottom: const TTabBar(
                      tabs: [
                        Tab(child: Text('Sports')),
                        Tab(child: Text('Furniture')),
                        Tab(child: Text('Electronics')),
                        Tab(child: Text('Cloths')),
                        Tab(child: Text('Cosmetics')),
                      ],
                    ))
              ];
            },
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
