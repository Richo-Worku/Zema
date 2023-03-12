import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/album.dart';
import '../provider/theme_provider.dart';

class ReusableAllAlbumsCard extends StatelessWidget {
  final Album album;
  const ReusableAllAlbumsCard({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 120,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    album.album_coverImage.toString(),
                    scale: 1.0,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.album_name.toString(),
                  style: TextStyle(
                      fontSize: 17,
                      color: Provider.of<ThemeProvider>(context, listen: true)
                          .mainText,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  album.artist_name.toString(),
                  style: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: true)
                          .mediumText),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
