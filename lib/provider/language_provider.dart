// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Future changeLanguage(String language, BuildContext context) async {
    await context.setLocale(Locale(language));
    notifyListeners();
  }
}
