import 'package:flutter/material.dart';
import 'package:zema_multimedia/constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  Color background = Color.fromARGB(255, 204, 204, 204);
  Color mainText = Color.fromARGB(255, 17, 17, 17);
  Color mediumText = Color.fromARGB(255, 59, 58, 58);
  bool isDarkMode = true;
  change() {
    if (isDarkMode) {
      background = mainDarkModeBackground;
      mainText = mainDarkModeTextColor;
      mediumText = mediumDarkModeTextColor;
    } else {
      background = Color.fromARGB(255, 204, 204, 204);
      mainText = Color.fromARGB(255, 17, 17, 17);
      mediumText = Color.fromARGB(255, 59, 58, 58);
    }

    isDarkMode = !isDarkMode;

    notifyListeners();
  }
}
