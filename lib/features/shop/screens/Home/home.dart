// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'package:tstore/utils/constants/image_strings.dart';
import 'package:tstore/utils/constants/sizes.dart';


import '../../../../common/styles/widgets/custome_shapes/containers/TPrimaryHeaderContainer.dart';
import '../../../../common/styles/widgets/custome_shapes/containers/search_container.dart';
import '../../../../common/styles/widgets/imageTextWidget/vertical_image_text.dart';
import '../../../../common/styles/widgets/texts/section_heading.dart';
import 'widgets/THomeAppBar.dart';
import 'widgets/THomeCategories.dart';

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
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBwSections),
                  // ! --- SearchBar -- ! //
                   TSearchController(
                    text: 'Search in Store',
                  ),
                  const SizedBox(height: TSizes.spaceBwSections),

                  // ! --- Categories -- ! //
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false),
                        const SizedBox(height: TSizes.spaceBwSections),

                        // ---- Categoreies ---- //
                        THomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




