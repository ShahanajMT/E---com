// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';


import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_fn.dart';

class TVerticalTextImage extends StatelessWidget {
  const TVerticalTextImage({
    Key? key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroudColor,
     this.isNetworkImage = true,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroudColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TCircularImage(image: image),

            //TCircularImage(image: image),
            Container(
              
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroudColor ?? (darkMode ? TColors.black : TColors.white),
                  //color: TColors.dark,
                  border: Border.all(color: darkMode ? TColors.light : TColors.dark),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                
                // child: Image(
                //   image: AssetImage(image),
                //   fit: BoxFit.cover,
                //   color: darkMode ? TColors.light : TColors.dark,
                // ),

                child: TCircularImage(image: image, fit: BoxFit.cover, padding: TSizes.sm *1.4, isNetworkImage: isNetworkImage, backgroudColor: backgroudColor, overlayColor: THelperFunction.isDarkMode(context) ? TColors.light : TColors.dark),
              ),
            ),

            // text
            const SizedBox(height: TSizes.spaceBwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! ------------------------------------ --------------------------!//

// import 'package:flutter/material.dart';
// import 'package:tstore/common/styles/widgets/images/T_CircularImage.dart';

// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/helpers/helper_fn.dart';

// class TVerticalTextImage extends StatelessWidget {
//   const TVerticalTextImage({
//     Key? key,
//     required this.image,
//     required this.title,
//     this.textColor = TColors.white,
//     this.backgroundColor,
//     this.isNetworkImage = true,
//     this.onTap,
//   }) : super(key: key);

//   final String image;
//   final String title;
//   final Color textColor;
//   final Color? backgroundColor;
//   final bool isNetworkImage;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final darkMode = THelperFunction.isDarkMode(context);

//     // Load asset if not a network image
//     Widget imageWidget;
//     if (isNetworkImage) {
//       // Network image
//       imageWidget = Image.network(
//         image,
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) {
//           // Handle image loading errors
//           return Container(
//             width: 56,
//             height: 56,
//             color: Colors.transparent, // Placeholder color for error
//             child: Icon(Icons.error), // Placeholder error icon
//           );
//         },
//       );
//     } else {
//       // Local asset
//       imageWidget = Image.asset(
//         image,
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) {
//           // Handle image loading errors
//           return Container(
//             width: 56,
//             height: 56,
//             color: Colors.grey, // Placeholder color for error
//             child: Icon(Icons.error), // Placeholder error icon
//           );
//         },
//       );
//     }

//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(left: TSizes.md),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 56,
//               width: 56,
//               padding: const EdgeInsets.all(TSizes.sm),
//               decoration: BoxDecoration(
//                 color: backgroundColor ?? (darkMode ? TColors.black : TColors.white),
//                 border: Border.all(color: darkMode ? TColors.light : TColors.dark),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: imageWidget, // Use the loaded image widget
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBwItems / 2),
//             SizedBox(
//               width: 55,
//               child: Center(
//                 child: Text(
//                   title,
//                   style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

