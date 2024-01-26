import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunction {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Black') {
      return Colors.black;
    } else {
      return null;
    }
  }

  static void showSnakBar(String msg) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  static void showAlert(String title, String msg) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok')),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}....';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSizes) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSizes) {
      final rowChildrens = widgets.sublist(
        i,
        i + rowSizes > widgets.length ? widgets.length : i + rowSizes,
      );
      wrappedList.add(Row(children: rowChildrens));
    }
    return wrappedList;
  }
}
