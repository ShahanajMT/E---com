// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';


import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';

import '../../../../common/styles/widgets/custome_shapes/containers/TPrimaryHeaderContainer.dart';
import '../../../../common/styles/widgets/custome_shapes/containers/search_container.dart';

import '../../../../common/styles/widgets/texts/section_heading.dart';
import 'widgets/THomeAppBar.dart';
import 'widgets/THomeCategories.dart';
import 'widgets/TPramoSlider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
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
                            showActionButton: false),
                        SizedBox(height: TSizes.spaceBwSections),

                        // ---- Categoreies ---- //
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //! Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: TPramoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


