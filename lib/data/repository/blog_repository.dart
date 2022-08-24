import 'package:dio/dio.dart';
import 'package:la_vie_web/data/model/blogs/all_blogs_model.dart';

import '../../business/dio_client.dart';
import '../../business/dio_exception.dart';
import '../model/blogs/blog_model.dart';

class BlogRepository {

  DioClient dio = DioClient();
  final endpoint = "/api/v1/products/blogs";


  /// Get One Blog
  Future<BlogModel> getBlogOne(String token, {required String blogId}) async {

    try {
      Response response = await dio.get(
          "$endpoint/$blogId",
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return BlogModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  /// Get All Blogs
  Future<AllBlogsModel> getBlogs(String token) async {

    try {
      Response response = await dio.get(
          endpoint,
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return AllBlogsModel.fromJson(response.data);

    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}