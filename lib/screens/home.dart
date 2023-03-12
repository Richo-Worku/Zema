import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../translation/locale_keys.g.dart';
import 'albums.dart';
import 'explore.dart';
import 'favourite.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Localizations.localeOf(context).toString();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.only(bottom: 10, top: 10),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(LocaleKeys.explore.tr()),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(LocaleKeys.albums.tr()),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(LocaleKeys.favourites.tr()),
                        ),
                      ),
                    ),
                  ],
                ), // TabBar
                //  title: const Text('GeeksForGeeks'),
                backgroundColor: const Color(0xffFE3562))), // AppBar
        body: const TabBarView(
          children: [
            Explore(),
            Albums(),
            Favourite(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              !Provider.of<ThemeProvider>(context, listen: true).isDarkMode
                  ? Colors.pink
                  : const Color.fromARGB(255, 39, 39, 39),
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).change();
          },
          child: Provider.of<ThemeProvider>(context, listen: true).isDarkMode
              ? const Icon(
                  Icons.dark_mode,
                  size: 25,
                )
              : const Icon(
                  Icons.light_mode,
                  size: 25,
                ),
        ),
      ),
    );
  }
}
