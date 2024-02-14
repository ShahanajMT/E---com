// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:tstore/common/styles/widgets/custome_shapes/containers/TRoundedContainer.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/constants/sizes.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    Key? key,
    required this.isSelectedAddress,
  }) : super(key: key);

  final bool isSelectedAddress;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroudColor: isSelectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: isSelectedAddress
          ? Colors.transparent
          : darkMode
              ? TColors.darkergrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBwItems),
      child: Stack(
        children: [
          Positioned(
            right: 15,
            top: 0,
            bottom: 10,
            child: Icon(
              isSelectedAddress ? Iconsax.tick_circle5 : null,
              color: isSelectedAddress
                  ? darkMode
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Britas' , maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: TSizes.sm / 2),
              const Text('+ 00974 66466021', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: TSizes.sm / 2),
              const Text('369 Panampally Nagar, MG Road, Ernakulam, Kerala', softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
