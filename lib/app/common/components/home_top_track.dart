import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class HomeTopTrack extends StatelessWidget {

  HomeTopTrack(this.imagePath, this.title, this.artist, this.duration);

  final String imagePath;
  final String title;
  final String artist;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 44.41,
              height: 44.41,
              child: Image.asset(imagePath),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.homeTopTrackTitle,
                ),
                Text(
                  artist,
                  style: Styles.homeTopTrackArtist,
                )
              ],
            ),
          ],
        ),
        Text(
          duration
        )
      ],
    );
  }
}