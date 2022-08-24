import 'package:dio/dio.dart';

import '../../../business/dio_client.dart';

class InitialController {
  static DioClient dio = DioClient();
  static String endpoint = "/api/v1";

  static Future<String> getInitialData() async {

    try {

      Response response = await dio.get(
          endpoint
      );

      print("Response: ${response.data}");

      return response.data;

    } catch (e) {
      print("error: $e");
      rethrow;
    }
  }
}