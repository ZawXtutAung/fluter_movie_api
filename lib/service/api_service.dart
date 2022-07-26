import 'package:dio/dio.dart';

const String link = 'https://movies-app1.p.rapidapi.com/api';

final baseOptions = BaseOptions()
  ..baseUrl = link
  ..receiveDataWhenStatusError = true
  ..connectTimeout = 3000
  ..receiveTimeout = 3000;

class ApiHelper {
  Response? response;
  String? mkey = '4b23e2e595mshb717bbb504b7541p139bdajsnb10f442c9ddf';
  String? mHost = 'movies-app1.p.rapidapi.com';
  Dio dio = Dio();
  moviesList() async {
    response = await dio.get("$link/movies",
        options: Options(headers: {
          'X-RapidAPI-Key':
              '4b23e2e595mshb717bbb504b7541p139bdajsnb10f442c9ddf',
          'X-RapidAPI-Host': 'movies-app1.p.rapidapi.com'
        }));
    if (response?.statusCode == 200) {
      print("profile ==> $response");
      if (response != null) {
        return response!.data!;
      }
    }
    ;
  }

  moviesdetail(String? ids) async {
    response = await dio.get("$link/movie/$ids",
        // queryParameters: {'params': mid},
        options: Options(headers: {
          'X-RapidAPI-Key':
              '4b23e2e595mshb717bbb504b7541p139bdajsnb10f442c9ddf',
          'X-RapidAPI-Host': 'movies-app1.p.rapidapi.com'
        }));
    if (response?.statusCode == 200) {
      print("profile ==> $response");
      if (response != null) {
        return response!.data!;
      }
    }
    ;
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}
