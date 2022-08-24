import 'package:dio/dio.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../model/products/tool_model/all_tool_model.dart';
import '../../model/products/tool_model/tool_model.dart';


class ToolRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/tools";


  /// Get One Tool
  Future<ToolModel> getToolOne(String token, {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return ToolModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /// Get All Tools
  Future<AllToolModel> getTools(String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllToolModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}