import 'dart:convert';

import 'package:cesarFlutter/services/services.dart';
import 'package:http/src/response.dart';

enum MockType {
  badRequestError, // 400
  internalServerError, // 500
  unauthorizedError, // 403
  filled,
  empty
}

class MockedService implements ServiceInterface {
  MockType type;

  MockedService({this.type});

  Future<Response> getAlbums() {
    print("OIii: "+this.type.toString());
    switch (type) {
      case MockType.badRequestError:
        return Future.error(400);
      case MockType.internalServerError:
        return Future.error(500);
      case MockType.unauthorizedError:
        return Future.error(403);
      case MockType.filled:
        return _mockFilledType();
      case MockType.empty:
        return _mockEmptyType();
    }
  }

  Future<Response> _mockFilledType() {
    Future<Response> future = Future<Response>(() {
      Map<String, dynamic> json = {
        "data": [
          {
              "title": "Sucker",
              "singer": "Jonas Brothers",
              "imageURL": "https://i.imgur.com/OUJbyTT.png"
          },
          {
              "title": "I Dont's Care",
              "singer": "Ed Sheerans & Bieber's",
              "imageURL": "https://i.imgur.com/AuOuk0Z.png"
          },
          {
              "title": "Old Town Road",
              "singer": "Lil Nas",
              "imageURL": "https://i.imgur.com/dVusUgq.png"
          }
        ]
      };

      var body = jsonEncode(json);
      return Response(body, 200);
    });

    return future;
  }

  Future<Response> _mockEmptyType() {
    Future<Response> future = Future<Response>(() {
      Map<String, dynamic> json = {"data": []};

      var body = jsonEncode(json);
      return Response(body, 200);
    });

    return future;
  }
}