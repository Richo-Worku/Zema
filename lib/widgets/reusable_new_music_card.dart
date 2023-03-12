import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../models/track.dart';
import '../provider/favourite_provider.dart';
import '../provider/theme_provider.dart';
import '../screens/player_screen.dart';

class ReusableNewMusicCard extends StatefulWidget {
  final Track track;
  final List<Track> favTracks;
  final bool check;
  const ReusableNewMusicCard(
      {super.key,
      required this.track,
      required this.favTracks,
      required this.check});

  @override
  State<ReusableNewMusicCard> createState() => _ReusableNewMusicCardState();
}

class _ReusableNewMusicCardState extends State<ReusableNewMusicCard> {
  final player = AudioPlayer();

  void loadAudio(String url) async {
    final duration = await player.setUrl(url);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    bool nextAction = widget.check;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.track.track_coverImage.toString()),
                      fit: BoxFit.cover),
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(right: 10, top: 10),
              height: 130,
              width: 130,
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PlayerScreen(track: widget.track)));
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 130,
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 95,
                        margin: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.track.track_name.toString(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mainText,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.clip,
                        )),
                    SizedBox(
                      width: 95,
                      child: Text(
                        widget.track.artist_name.toString(),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mediumText),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () async {
                      nextAction = await Provider.of<FavouriteProvider>(context,
                              listen: false)
                          .addToFavouriteTracks(widget.track);

                      if (!nextAction) {
                        //I show the snack bar because the delete api you provided is not working as expected.
                        var snackBar = const SnackBar(
                            content: Text(
                                'Delete Api You Provided Not Working as Expected!'));
                        // Step 3
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        var snackBar =
                            const SnackBar(content: Text('Added To Favourite'));
                        // Step 3
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      setState(() {});
                    },
                    child: nextAction
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : Align(
                            child: Icon(
                            Icons.favorite_border,
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mediumText,
                          )))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
