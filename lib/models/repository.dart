import 'package:dio/dio.dart';
import 'package:suitmedia_test/models/paginationFilter.dart';
import 'package:suitmedia_test/models/userModel.dart';

class Repository {
  Dio _dio;
  Repository(this._dio);

  Future<List<UserModel>> getUser(PaginationFilter filter) async {
    try {
      final response = await _dio.get(
        'https://reqres.in/api/users',
        queryParameters: {
          'page': filter.page,
          'per_page': filter.limit,
        },
      );
      final data = response.data['data'] as List<dynamic>;
      final result = data.map((e) => UserModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      throw e;
    }
  }
}
