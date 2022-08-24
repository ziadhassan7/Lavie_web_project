import 'package:dio/dio.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../model/products/seed_model/all_seed_model.dart';
import '../../model/products/seed_model/seed_model.dart';


class SeedRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/seeds";


  /// Get One Seed
  Future<SeedModel> getSeedOne(String token, {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return SeedModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /// Get All Seeds
  Future<AllSeedModel> getSeeds(String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllSeedModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

}