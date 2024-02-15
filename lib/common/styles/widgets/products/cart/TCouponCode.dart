import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_fn.dart';
import '../../custome_shapes/containers/TRoundedContainer.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
     final darkMode = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroudColor: darkMode ? TColors.dark : TColors.light,
      padding: const EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          right: TSizes.sm,
          left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a Pramo Code ? Enter Here!',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),

          // ---- Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: darkMode
                      ? TColors.white.withOpacity(0.5)
                      : TColors.black.withOpacity(0.5),
                  backgroundColor: TColors.grey.withOpacity(0.2),
                  side: BorderSide(
                    color: TColors.grey.withOpacity(0.1),
                  ),
                ),
                child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}