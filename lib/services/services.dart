import 'package:http/http.dart' as http;

abstract class ServiceInterface {
  Future<http.Response> getAlbums();
}

class Service implements ServiceInterface {
  Future<http.Response> getAlbums() async {
    return http.get(
        "https://raw.githubusercontent.com/thelifesnak3/cesarFlutter2/master/assets/network/albums.json");
  }
}