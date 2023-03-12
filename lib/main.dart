import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zema_multimedia/provider/album_provider.dart';
import 'package:zema_multimedia/provider/artist_provider.dart';
import 'package:zema_multimedia/provider/favourite_provider.dart';
import 'package:zema_multimedia/provider/language_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';
import 'package:zema_multimedia/provider/theme_provider.dart';
import 'package:zema_multimedia/provider/track_provider.dart';
import 'package:zema_multimedia/screens/splashscreen.dart';
import 'package:zema_multimedia/translation/codegen_loader.g.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

const String url =
    "https://exam.calmgrass-743c6f7f.francecentral.azurecontainerapps.io/";
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffE6DBDD),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],
      startLocale: const Locale("am"),
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageProvider()),
          ChangeNotifierProvider(create: (context) => AlbumProvider()),
          ChangeNotifierProvider(create: (context) => TrackProvider()),
          ChangeNotifierProvider(create: (context) => ArtistProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Zema Music Application',
          theme: ThemeData(),
          home: const SplashScreen(),
        ));
  }
}
