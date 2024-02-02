import 'package:flutter/material.dart';

import '../../../../../common/styles/widgets/imageTextWidget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalTextImage(
            image: TImages.clothIcon,
            title: 'Cloth',
            onTap: () {},
          );
        },
      ),
    );
  }
}