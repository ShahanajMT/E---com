// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../common/styles/widgets/imageTextWidget/vertical_image_text.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    Key? key,
    required this.images,
    required this.titles,
  }) : super(key: key);

  final List <String> images;
  final List <String> titles;

  @override
  Widget build(BuildContext context) {
    assert(images.length == titles.length);
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalTextImage(
            image: images[index],
            title: titles[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
