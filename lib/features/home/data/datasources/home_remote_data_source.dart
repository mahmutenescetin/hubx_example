import 'dart:convert';

import 'package:hubx_example/core/network/dio_client.dart';
import 'package:hubx_example/features/home/data/models/category_model.dart';
import 'package:hubx_example/features/home/data/models/question_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<List<QuestionModel>> getQuestions();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dioClient.get('/getCategories');
      print('📊 Response Data: ${response.data}');

      dynamic responseData = response.data;

      if (responseData is String) {
        responseData = json.decode(responseData);
      }

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data')) {
        responseData = responseData['data'];
      }

      if (responseData is List) {
        final categories =
            responseData.map((json) => CategoryModel.fromJson(json)).toList();

        return categories;
      } else {
        throw Exception('API yanıtı beklenildiği gibi bir liste değil.');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await dioClient.get('/getQuestions');
      print('📊 Response Data: ${response.data}');

      dynamic responseData = response.data;

      if (responseData is String) {
        responseData = json.decode(responseData);
      }

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data')) {
        responseData = responseData['data'];
      }

      if (responseData is List) {
        final questions =
            responseData.map((json) => QuestionModel.fromJson(json)).toList();

        return questions;
      } else {
        throw Exception('API yanıtı beklenildiği gibi bir liste değil.');
      }
    } catch (e) {
      throw Exception('Failed to load questions: $e');
    }
  }
}
