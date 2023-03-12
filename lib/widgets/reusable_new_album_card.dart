import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../models/album.dart';
import '../provider/theme_provider.dart';

class ReusableNewAlbumCard extends StatelessWidget {
  final Album album;
  const ReusableNewAlbumCard({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(album.album_coverImage.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink),
          margin: const EdgeInsets.only(right: 10, top: 10),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 1.5,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        album.album_name.toString(),
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Provider.of<ThemeProvider>(context,
                                    listen: true)
                                .mainText),
                      )),
                  Text(
                    album.artist_name.toString(),
                    style: TextStyle(
                        color: Provider.of<ThemeProvider>(context, listen: true)
                            .mediumText),
                  ),
                ],
              ),
              const Align(child: Icon(Icons.more_vert))
            ],
          ),
        ),
      ],
    );
  }
}
