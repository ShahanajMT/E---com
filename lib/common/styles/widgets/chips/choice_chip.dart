// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tstore/common/styles/widgets/custome_shapes/containers/circular_container.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    Key? key,
    required this.text,
    required this.selected,
    this.onSelected,
  }) : super(key: key);

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor =  THelperFunction.getColor(text)!= null;
    return  Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? TColors.white : null),
        avatar: isColor  ? TCircularContainer(backgroudColor: THelperFunction.getColor(text)!, width: 50, height: 50,) : null,
        shape: isColor  ? const CircleBorder() : null,
        labelPadding:isColor  ? const EdgeInsets.all(0) : null,
        padding:isColor  ? const EdgeInsets.all(0) : null,
        selectedColor: isColor  ? THelperFunction.getColor(text)!  : null,
        backgroundColor: isColor  ? THelperFunction.getColor(text)!  : null,
      ),
    );
  }
}
