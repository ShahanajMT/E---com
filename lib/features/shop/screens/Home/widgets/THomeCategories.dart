// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/common/styles/widgets/shimmers/TCategory_shimmer.dart';
import 'package:tstore/features/shop/controllers/category_controller.dart';

import '../../../../../common/styles/widgets/imageTextWidget/vertical_image_text.dart';
import '../../subcategory/subcategory.dart';





class THomeCategories extends StatelessWidget {
  const THomeCategories({
    Key? key,
    // required this.images,
    // required this.titles,
  }) : super(key: key);

  // final List <String> images;
  // final List <String> titles;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    //assert(images.length == titles.length);
    return Obx(
     
      () {
        if (categoryController.isLoading.value) return const TCategoryShimmer();

        if (categoryController.featuredCategories.isEmpty) {
          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
        }
        return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          // itemCount: 5,
           itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryController.featuredCategories[index];
            print(category);
            return TVerticalTextImage(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategories()),
            );
          },
        ),
      );
      } 
    );
  }
}
