class AlbumModel {
  String title;
  String singer;
  String imageUrl;

  AlbumModel(
    {
      this.title,
      this.singer,
      this.imageUrl
    }
  );

  AlbumModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    singer = json['singer'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['singer'] = this.singer;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}