import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    Key? key,
     this.currentSign = "\$",
    required this.price,
     this.maxLines = 1,
     this.isLarge = false,
     this.lineThrough = false,
  }) : super(key: key);

  final String currentSign;
  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentSign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null) : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}