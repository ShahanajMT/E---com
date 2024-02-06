// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'package:tstore/common/styles/widgets/texts/t_BrandTitleText.dart';
import 'package:tstore/utils/constants/enums.dart';



class TBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleTextWithVerifiedIcon({
    Key? key,
    required this.title,
     this.maxlines = 1,
    this.textColor,
    
    this.textAlign,
     this.brandTextSizes = TextSizes.small,
  }) : super(key: key);

  final String title;
  final int maxlines;
  final Color? textColor;
 
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            textAlign: textAlign,
            maxlines: maxlines,
            brandTextSizes: brandTextSizes,
          ),
        ),
        
      ],
    );
  }
}
