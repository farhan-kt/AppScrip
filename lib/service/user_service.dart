import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:users_app/model/user_model.dart';

class UserService {
  Dio dio = Dio();

  Future<List<UserModel>> getData() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await dio.get(url);
      log('URL: $url');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((user) => UserModel.fromJson(user)).toList();
      } else {
        log('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Error in ApiService: $e');
      rethrow;
    }
  }
}
