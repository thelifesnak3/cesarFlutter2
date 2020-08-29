import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
   @override
  Future onRequest(RequestOptions options) {
    print("REQUEST ${options.method} => BASE URL ${options.baseUrl} => PATH ${options.path}");
    // Adicionar token na saida das requisições
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // 200, 201
    print("RESPONSE PATH: "+response.request.path);
    print("RESPONSE CODE: "+response.statusCode.toString());

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // Tratamento para Exception
    print("ERROR MENSAGEM -> "+err.error.toString());
    return super.onError(err);
  }
}