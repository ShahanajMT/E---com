// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/devices/device_utility.dart';
import 'package:tstore/utils/helpers/helper_fn.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  const TTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Material(
      color: darkMode ? TColors.black : TColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkgrey,
        labelColor: darkMode ? TColors.white : TColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
