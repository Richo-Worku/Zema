// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> am = {
  "newalbums": "አዲስ አልበሞች",
  "explore": "ማሰስ",
  "albums": "አልበሞች",
  "favourites": "የወደዷቸው",
  "newmusic": "አዳዲስ ሙዚቃዎች",
  "newartists": "አዳዲስ አርቲስቶች",
  "email": "ኢሜይል",
  "login": "ይግቡ",
  "password": "የማለፊያ ቃል",
  "donthaveaccount": "መለያ የለህም?",
  "createaccount": "መለያ ፍጠር",
  "haveaccount": "መለያ አለህ?"
};
static const Map<String,dynamic> en = {
  "newalbums": "New Albums",
  "explore": "Explore",
  "albums": "Albums",
  "favourites": "Favourites",
  "newmusic": "New Musics",
  "newartists": "New Artists",
  "email": "Email",
  "login": "Login",
  "password": "Password ",
  "donthaveaccount": "dont have account?",
  "createaccount": "Create Account",
  "haveaccount": "Already have Account?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"am": am, "en": en};
}
