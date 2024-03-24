// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/products/product_cart/TProductCart_vertical.dart';
import 'package:tstore/features/shop/screens/allProducts/all_products.dart';

import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/constants/text_strings.dart';

import '../../../../common/styles/widgets/custome_shapes/containers/TPrimaryHeaderContainer.dart';
import '../../../../common/styles/widgets/custome_shapes/containers/search_container.dart';

import '../../../../common/styles/widgets/layout/TGridlayout.dart';
import '../../../../common/styles/widgets/texts/section_heading.dart';
import 'widgets/THomeAppBar.dart';
import 'widgets/THomeCategories.dart';
import 'widgets/TPramoSlider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    // ! --- AppBar -- ! //
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBwSections),
                    // ! --- SearchBar -- ! //
                    TSearchController(
                      text: 'Search in Store',
                      
                    ),
                    SizedBox(height: TSizes.spaceBwSections),

                    // ! --- Categories -- ! //
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            
                          ),
                          SizedBox(height: TSizes.spaceBwSections),

                          // ---- Categoreies ---- //
                          THomeCategories(
                            // images: [
                            //   TImages.animalIcon,
                            //   TImages.animationIcon,
                            //   TImages.clothIcon,
                            //   TImages.cosmeticsIcon,
                            //   TImages.electronicsIcon,
                            //   TImages.furnitureIcon,
                            //   TImages.jweleryIcon,
                            //   TImages.shoesIcon,
                            //   TImages.sportsIcon,
                            //   TImages.toysIcon,
                            // ],
                            // titles: [
                            //   TTexts.animal,
                            //   TTexts.animation,
                            //   TTexts.cloths,
                            //   TTexts.cosmetics,
                            //   TTexts.electronics,
                            //   TTexts.furniture,
                            //   TTexts.jwelery,
                            //   TTexts.shoes,
                            //   TTexts.sports,
                            //   TTexts.toys,
                            // ],
                          ),

                          // ---
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //! Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // ---- CarouselSlider ---- //
                    const TPramoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBwSections),

                    // ---- Heading ---- //
                    TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts()),),
                    const SizedBox(height: TSizes.spaceBwItems),

                    // ---- Popular Products ----- //

                    TGridLayout(
                      itemCount: 6,
                      itemBuilder: (_, index) => const TProductCardVertical(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
