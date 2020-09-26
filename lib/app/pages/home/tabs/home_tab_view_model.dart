import 'dart:convert';

import 'package:cesarFlutter/app/models/Album.dart';
import 'package:cesarFlutter/services/services.dart';

class AlbumAdapter {
  String featuredTrack;
  String topTrack;
  bool isLoading;
  List<AlbumModel> albums;
  bool inError;

  AlbumAdapter(
      {this.featuredTrack, this.topTrack, this.isLoading, this.albums, this.inError});
}

abstract class HomeTabViewModelInterface {
  // Variables
  AlbumAdapter adapter;
  Function didUpdate;

  // Methods
  fetchAlbums();
}

class HomeTabViewModel implements HomeTabViewModelInterface {
  // Variables
  AlbumAdapter adapter = AlbumAdapter(
      featuredTrack: "Featured Tracks", topTrack: "Top Tracks", isLoading: false, albums: [], inError: false);
  Function didUpdate;
  ServiceInterface service;

  HomeTabViewModel({this.service});

  // Methods
  fetchAlbums() async {
    adapter.isLoading = true;
    if (didUpdate != null) {
      didUpdate(adapter);
    }

    return service.getAlbums().then((response) {
      var json = jsonDecode(response.body)["data"];
      adapter.albums = [];

      for (var albumJson in json) {
        adapter.albums.add(AlbumModel.fromJson(albumJson));
      }

      adapter.isLoading = false;
      adapter.inError = false;

      if (didUpdate != null) {
        didUpdate(adapter);
      }
    }).catchError((error) {
      adapter.inError = true;
      if (didUpdate != null) {
        didUpdate(adapter);
      }
    });
  }
}