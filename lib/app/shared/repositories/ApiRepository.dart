import 'package:cesarFlutter/app/models/Album.dart';
import 'package:cesarFlutter/app/shared/ApiResponse.dart';
import 'package:cesarFlutter/app/shared/Constants.dart';
import 'package:dio/dio.dart';


class ApiRepository {
  var dio = Dio();

  ApiRepository();

  Future<ApiResponse> getAlbums() async {
    ApiResponse apiResponse = new ApiResponse();
    print("AQUIIIIIII");
    try {
      var response = await dio.get(API_URL_BASE+"albums.json");
      print("aqui 2");
      apiResponse.status = 200;
      print(response);
      if(response.data != null) {
        apiResponse.data = (response.data as List)
            .map((item) => AlbumModel.fromJson(item))
            .toList();

        return apiResponse;
      }
    } on DioError catch (e) {
      print(e.response);
      if(e.response != null) {
        apiResponse.status = e.response.statusCode;
        apiResponse.message = e.response.data['mensagem'];
        return apiResponse;
      }
      apiResponse.message = "Serviço está fora do ar!";
      return apiResponse;
    }

    return null;
  }


}