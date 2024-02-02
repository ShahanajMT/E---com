import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../curved_edgets/TcurvedEdgetWidgets.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              //! BackgroudCustom Shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: TCircularContainer(
                      backgroudColor:
                          TColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: TCircularContainer(
                      backgroudColor:
                          TColors.textWhite.withOpacity(0.1))),

                          if (child != null) Positioned.fill(child: child!),
                          
            ],
          ),
        ),
      ),
    );
  }
}