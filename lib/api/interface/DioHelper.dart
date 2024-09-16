import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DioHelper {
  final Dio _dio;

  DioHelper(this._dio);

  Future<Response?> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      print('GET response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<Response?> post(
      String url,
      dynamic data, {
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print('POST response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<Response?> put(
      String url,
      dynamic data, {
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print('PUT response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<Response?> patch(
      String url,
      dynamic data, {
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print('PATCH response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<Response?> delete(
      String url, {
        dynamic data,
        Map<String, dynamic>? headers,
      }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        options: Options(headers: headers),
      );
      print('DELETE response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<Response?> uploadFile(
      String url,
      File file, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      print('File upload response: ${response.data}');
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<void> downloadFile(
      String url,
      String savePath, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      await _dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      print('File downloaded to $savePath');
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  void handleDioException(DioException e) {
    if (e.response != null) {
      print('DioException response: ${e.response}');
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
      );
    } else {
      print('DioException error: ${e.message}');
      throw DioException(
        requestOptions: e.requestOptions,
        message: e.message,
      );
    }
  }

  Map<String,dynamic>? responseDecoder(dynamic response){
    Map<String,dynamic> jsonResponse = json.decode(response.toString());
    if(kDebugMode){
      print('Json Data : ${jsonResponse.toString()}');
    }
    return jsonResponse;
  }
}