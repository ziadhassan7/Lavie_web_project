import 'package:dio/dio.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../model/products/plant_model/all_plant_model.dart';
import '../../model/products/plant_model/plant_model.dart';


class PlantRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/plants";


  /// Get One Plant
  Future<PlantModel> getPlantOne(String token, {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return PlantModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /// Get All Plants
  Future<AllPlantModel> getPlants(String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllPlantModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}