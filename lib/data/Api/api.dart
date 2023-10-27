import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/widgets.dart';

class API {
  late Dio dio;

  late String _apiKey;

  late String _baseUrl;

  API() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      RetryInterceptor(dio: dio, logPrint: print, retries: 3, retryDelays: [
        const Duration(seconds: 20),
        const Duration(seconds: 20),
        const Duration(seconds: 20),
      ], retryableExtraStatuses: {
        status403Forbidden
      }),
    );
    _apiKey = '2XczhsKleaIUzfwdTSsgPtSVI7HB9BbfaTrLZFkp';
    _baseUrl =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos';
  }
  Future<List<dynamic>> fetchPhotos(String earthDate) async {
    try {
      Response response = await dio.request(
        _baseUrl,
        options: Options(
          method: "get",
          //headers: as token if there is an auth
        ),
        queryParameters: {
          "earth_date": earthDate,
          "api_key": _apiKey,
        },
      );
      debugPrint(response.statusCode.toString());
      return response.data['photos'];
    } catch (e) {
      if (e is DioException) {
        debugPrint(e.message);
      } else {
        debugPrint(e.toString());
      }
      return [];
    }
  }
}
