import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/track.dart';
import '../provider/favourite_provider.dart';
import '../provider/theme_provider.dart';

class ReusableFavouriteCard extends StatefulWidget {
  final Track favouriteTracks;
  const ReusableFavouriteCard({super.key, required this.favouriteTracks});

  @override
  State<ReusableFavouriteCard> createState() => _ReusableFavouriteCardState();
}

class _ReusableFavouriteCardState extends State<ReusableFavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget
                                .favouriteTracks.track_coverImage
                                .toString()),
                            fit: BoxFit.cover),
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.favouriteTracks.track_name.toString(),
                        style: TextStyle(
                          color:
                              Provider.of<ThemeProvider>(context, listen: true)
                                  .mainText,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.favouriteTracks.artist_name.toString(),
                        style: TextStyle(
                          color:
                              Provider.of<ThemeProvider>(context, listen: true)
                                  .mediumText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Provider.of<FavouriteProvider>(context, listen: false)
                        .deleteTrackFromFavorites(
                            widget.favouriteTracks, context);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ))
            ],
          ),
        ),
        // Divider(
        //   color: Colors.pink,
        // )
      ],
    );
  }
}
