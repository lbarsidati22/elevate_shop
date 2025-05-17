import 'package:dio/dio.dart';
import 'package:elevate_shop/core/functions/app_constants.dart';

// api clls this class for evry call in api
class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
    ),
  );
  // This function is for fetching data
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }

  // This function is for post (add) data
  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  // This function is for update data
  Future<Response> updateData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  // This function is for delete data from backend
  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
