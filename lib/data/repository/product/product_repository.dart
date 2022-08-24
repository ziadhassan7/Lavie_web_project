import 'package:dio/dio.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../model/products/products_model/all_product_model.dart';
import '../../model/products/products_model/product_model.dart';


class ProductRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/products";


  /// Get One Product
  Future<ProductModel> getProductOne(String token, {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );

      return ProductModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /// Get All Products
  Future<AllProductsModel> getProducts(String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );

      return AllProductsModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

}