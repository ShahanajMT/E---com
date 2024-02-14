import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/devices/device_utility.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text,
              style:
                  Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width:
                TDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor:
                  const AlwaysStoppedAnimation(TColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}