import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:provider/provider.dart';

import '../models/album.dart';
import '../provider/album_provider.dart';
import '../provider/theme_provider.dart';
import '../translation/locale_keys.g.dart';
import '../widgets/reusable_all_albums.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  late List<Album> albums;
  @override
  void initState() {
    albums = context.read<AlbumProvider>().albums;
    // TODO: implement initState

    if (albums.isEmpty) {
      loadAlbumData();
    }
    super.initState();
  }

  loadAlbumData() async {
    await context.read<AlbumProvider>().getAllAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Provider.of<ThemeProvider>(context, listen: true).background,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.albums.tr(),
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: true)
                          .mainText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<AlbumProvider>(
                  builder: (context, value, child) => !value.isAlbumLoading
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height - 150,
                          child: Center(
                            child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: value.albums.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return ReusableAllAlbumsCard(
                                  album: value.albums[index],
                                );
                              },
                            ),
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
        ));
  }
}
