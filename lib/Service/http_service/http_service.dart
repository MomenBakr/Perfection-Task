
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../Model/api_model.dart';



class HttpService {
  static final http.Client client = http.Client();

  static ApiResult<dynamic> handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResult.success(jsonDecode(response.body));
      case 403:
        return ApiResult.failure('Forbidden: ${response.body}');
      case 404:
        return ApiResult.failure('Not found: ${response.body}');
      case 500:
        return ApiResult.failure('Internal server error: ${response.body}');
      default:
        return ApiResult.failure('${jsonDecode(response.body)['message'].toString()}');
    }
  }



  static Future<ApiResult<dynamic>> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters, String? token}) async {
    try {
      //debug print
      print('GET request to $endpoint');

      Map<String, String> headers = {};

      if (token != null) {
        headers['Auth'] = '$token';
      }

      final uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
      final response = await client.get(uri, headers: headers);
      return handleResponse(response);
    } catch (e) {
      return ApiResult.failure('GET request failed: $e');
    }
  }




  static Future<ApiResult<dynamic>> postRequest(
      String endpoint,
      Map<String, dynamic> data,
      {String? token}) async {
    try {
      // Initialize headers
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // var headers = {'Auth': '', 'FirebaseToken': '', 'Platform': ''};


      // if (token != null) {
      //   headers['Authorization'] = 'Bearer $token';
      // }

      final uri = Uri.parse(endpoint);


      final response = await client.post(
        uri,
        body: jsonEncode(data),
        headers: headers,
      );
      print(response);
      return handleResponse(response);
    } catch (e) {
      return ApiResult.failure('POST request failed: $e');
    }
  }






}