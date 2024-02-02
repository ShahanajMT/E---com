// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';



import 'package:tstore/utils/constants/sizes.dart';


import '../../../../common/styles/widgets/custome_shapes/containers/TPrimaryHeaderContainer.dart';
import '../../../../common/styles/widgets/custome_shapes/containers/search_container.dart';
import 'widgets/THomeAppBar.dart';

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

                  // ! --- Categories -- ! //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
