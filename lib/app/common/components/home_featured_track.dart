import 'package:cesarFlutter/app/common/styles/styles.dart';
import 'package:cesarFlutter/app/models/Album.dart';
import 'package:flutter/material.dart';

class HomeFeaturedTrack extends StatelessWidget {

  HomeFeaturedTrack(this.albums, this.index);

  final List<AlbumModel> albums;
  final index;

  @override
  Widget build(BuildContext context) {
    print(albums[index].title);
    print(albums[index].singer);
    print(albums[index].imageUrl);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 112,
          width: 112,
          child: Image.network(albums[index].imageUrl),
        ),
        SizedBox(height: 3),
        Text(
          albums[index].title,
          style: Styles.homeFeaturedTrackTitle,
        ),
        SizedBox(height: 3),
        Text(
          albums[index].singer,
          style: Styles.homeFeaturedTrackArtist,
        )
      ],
    );
  }
}