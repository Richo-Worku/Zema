import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/artist.dart';
import '../provider/theme_provider.dart';

class ReusableNewArtistCard extends StatelessWidget {
  final Artist artist;
  const ReusableNewArtistCard({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(artist.artist_profileImage.toString()),
                    fit: BoxFit.cover),
                color: Colors.pink,
                borderRadius: BorderRadius.circular(100)),
            margin: const EdgeInsets.only(right: 10, top: 10),
            height: 130,
            width: 130),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 130,
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      artist.artist_name.toString(),
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color:
                              Provider.of<ThemeProvider>(context, listen: true)
                                  .mainText),
                    )),
                Text(
                  artist.artist_description.toString(),
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: true)
                          .mediumText),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
