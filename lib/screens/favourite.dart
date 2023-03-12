import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/track.dart';
import '../provider/favourite_provider.dart';
import '../provider/theme_provider.dart';
import '../translation/locale_keys.g.dart';
import '../widgets/reusable_favourite_card.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late List<Track> favouritTracks;
  @override
  void initState() {
    favouritTracks = context.read<FavouriteProvider>().favoriteTracks;
    if (favouritTracks.isEmpty) {
      loadFavouriteTrack();
    }
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  loadFavouriteTrack() async {
    await context.read<FavouriteProvider>().getAllFavouriteTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context, listen: true).background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.favourites.tr(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Provider.of<ThemeProvider>(context, listen: true)
                      .mainText,
                ),
              ),
              const SizedBox(height: 20),
              Consumer<FavouriteProvider>(
                builder: (context, value, child) =>
                    !value.isFavouriteTrackLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height - 160,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: value.favoriteTracks.length,
                              itemBuilder: (context, index) {
                                return ReusableFavouriteCard(
                                  favouriteTracks: value.favoriteTracks[index],
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Image.asset(
                              'assets/images/loadingg.jpg',
                              height: 125.0,
                              width: 125.0,
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
