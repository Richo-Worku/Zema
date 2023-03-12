import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/album.dart';
import '../models/artist.dart';
import '../models/track.dart';
import '../provider/album_provider.dart';
import '../provider/artist_provider.dart';
import '../provider/favourite_provider.dart';
import '../provider/language_provider.dart';
import '../provider/theme_provider.dart';
import '../provider/track_provider.dart';
import '../translation/locale_keys.g.dart';
import '../widgets/reusable_new_album_card.dart';
import '../widgets/reusable_new_artist_card.dart';
import '../widgets/reusable_new_music_card.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  // @override
  // bool get wantKeepAlive => true;

  late List<Album> albums;
  late List<Artist> artists;
  late List<Track> tracks;
  late List<Track> favouriteTracks;
  // late List<Track> favouriteTracks;

  @override
  void initState() {
    // TODO: implement initState
    albums = context.read<AlbumProvider>().albums;
    artists = context.read<ArtistProvider>().artists;
    tracks = context.read<TrackProvider>().tracks;
    favouriteTracks = context.read<FavouriteProvider>().favoriteTracks;
    if (albums.isEmpty && artists.isEmpty && tracks.isEmpty) {
      loadAlbumData();
      loadArtistData();
      loadTrackData();
    }

    if (favouriteTracks.isEmpty) {
      loadFavouriteData();
    }
    super.initState();
  }

  loadAlbumData() async {
    await context.read<AlbumProvider>().getAllAlbums();
  }

  loadArtistData() async {
    await context.read<ArtistProvider>().getAllArtists();
  }

  loadTrackData() async {
    await context.read<TrackProvider>().getAllTracks();
  }

  loadFavouriteData() async {
    await context.read<FavouriteProvider>().getAllFavouriteTracks();
  }

  @override
  Widget build(BuildContext context) {
    String key = Localizations.localeOf(context).toString();
    String currentlang = "en";
    List<String> lang = <String>['en', 'am'];

    switch (key) {
      case "am":
        currentlang = "am";
        break;
      case "en":
        currentlang = "en";
        break;
    }
    bool loading =
        Provider.of<AlbumProvider>(context, listen: true).isAlbumLoading ||
            Provider.of<TrackProvider>(context, listen: true).isTrackLoading ||
            Provider.of<ArtistProvider>(context, listen: true).isArtistLoading;

    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context, listen: true).background,
      body: Center(
        child: SingleChildScrollView(
          child: !loading
              ? Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.explore.tr(),
                            style: TextStyle(
                                color: Provider.of<ThemeProvider>(context,
                                        listen: true)
                                    .mainText,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 100,
                            height: 40,
                            child: DropdownButtonFormField<String>(
                              dropdownColor: Colors.grey[250],
                              menuMaxHeight: 100,
                              itemHeight: 50,
                              elevation: 1,
                              isExpanded: false,
                              decoration: const InputDecoration(
                                  hintText: "",
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.language,
                                    size: 18,
                                    color: Colors.pink,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white24),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white24),
                                  ),
                                  isDense: true),
                              hint: Text(
                                currentlang.toUpperCase(),
                                style: TextStyle(
                                    color: Provider.of<ThemeProvider>(context,
                                            listen: true)
                                        .mainText),
                              ),
                              items: lang.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Provider.of<ThemeProvider>(
                                                context,
                                                listen: true)
                                            .mainText),
                                    // style: GoogleFonts.spaceMono(fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                if (value != null) {
                                  await context.setLocale(Locale(value));
                                  // ignore: use_build_context_synchronously
                                  await LanguageProvider()
                                      .changeLanguage(value, context);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      Consumer<AlbumProvider>(
                        builder: (context, value, child) =>
                            !value.isAlbumLoading
                                ? SizedBox(
                                    height: 205,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.albums.length,
                                      itemBuilder: (context, index) {
                                        return ReusableNewAlbumCard(
                                          album: value.albums[index],
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Image.asset(
                                      'assets/images/loadingg.jpg',
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                  ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        LocaleKeys.newmusic.tr(),
                        style: TextStyle(
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mainText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<TrackProvider>(
                        builder: (context, value, child) => !value
                                .isTrackLoading
                            ? SizedBox(
                                height: 205,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.tracks.length,
                                  itemBuilder: (context, index) {
                                    List<Track> tr = Provider.of<TrackProvider>(
                                            context,
                                            listen: false)
                                        .tracks;
                                    List<bool> test =
                                        Provider.of<FavouriteProvider>(context,
                                                listen: false)
                                            .check(tr);
                                    return ReusableNewMusicCard(
                                      check: test[index],
                                      track: value.tracks[index],
                                      favTracks: Provider.of<FavouriteProvider>(
                                              context,
                                              listen: true)
                                          .favoriteTracks,
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: Image.asset(
                                  'assets/images/loadingg.jpg',
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        LocaleKeys.newartists.tr(),
                        style: TextStyle(
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mainText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<ArtistProvider>(
                        builder: (context, value, child) =>
                            !value.isArtistLoading
                                ? SizedBox(
                                    height: 205,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value.artists.length,
                                      itemBuilder: (context, index) {
                                        return ReusableNewArtistCard(
                                          artist: value.artists[index],
                                        );
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Image.asset(
                                      'assets/images/loadingg.jpg',
                                      height: 50.0,
                                      width: 50.0,
                                    ),
                                  ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Image.asset(
                    'assets/images/loadingg.jpg',
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
        ),
      ),
    );
  }
}
