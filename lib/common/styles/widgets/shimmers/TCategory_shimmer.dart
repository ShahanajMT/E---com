import 'package:flutter/widgets.dart';
import 'package:tstore/common/widgets/TShimmer_effect.dart';
import 'package:tstore/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  final int itemCount;

  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
       
        separatorBuilder: (_, __) => const SizedBox(
          width: TSizes.spaceBwItems,
        ),
         itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBwItems / 2),

              // Text
              TShimmerEffect(width: 55, height: 6),
            ],
          );
         },
        
      ),
    );
  }
}
