import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class HomeFeaturedTrack extends StatelessWidget {

  HomeFeaturedTrack(this.imagePath, this.title, this.artist);

  final String imagePath;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 112,
          width: 112,
          child: Image.asset(imagePath),
        ),
        SizedBox(height: 3),
        Text(
          title,
          style: Styles.homeFeaturedTrackTitle,
        ),
        SizedBox(height: 3),
        Text(
          artist,
          style: Styles.homeFeaturedTrackArtist,
        )
      ],
    );
  }
}