import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/utils/console.dart';
import 'package:mt_flutter_task/utils/toast.dart';
import 'package:provider/provider.dart';

class AlbumRepository {
  final String baseUrl;
  final http.Client httpClient;

  AlbumRepository({required this.baseUrl, required this.httpClient});

  /// to get the album list data from API
  Future<ApiResponse> getAlbumList(BuildContext context, int? pageNo) async {
    var _data = Provider.of<AlbumDataProvider>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      _data.startLoading();

      /// to start the loading when the API is called
    });
    try {
      final response = await httpClient.get(
        Uri.parse('$baseUrl/albums')
            .replace(queryParameters: {'_page': '$pageNo'}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      Console.log("Endpoint: $baseUrl/albums?_page=$pageNo");

      if (response.statusCode == 200) {
        _data.dismissLoading();

        /// dismiss loading when response is successful
        Console.log("A1. Response from API: ${response.body}");
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        _data.dismissLoading();

        /// also dismiss loading when response is not successful
        Console.log("Status Code ${response.statusCode}: ${response.body}");
        switch (response.statusCode) {
          case 401:
            throw Exception('401 Unauthorized');
          case 400:
            throw Exception('400 Bad Request');
          case 404:
            throw Exception('404 Not Found');
          default:
            throw Exception(
                'Album list showing Failed (Status Code: ${response.statusCode})');
        }
      }
    } on Exception catch (error) {
      _data.dismissLoading();

      /// also dismiss loading when any error occurs
      showCustomToast(context, "${error.toString()}", "negative");
      throw Exception('An Error Occurred: ${error.toString()}');
    }
  }

  /// to get the searched album list data from API
  Future<ApiResponse> getAlbumSearchList(
      BuildContext context, String? query) async {
    var _data = Provider.of<AlbumDataProvider>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      _data.startLoading();

      /// to start the loading when the API is called
    });
    try {
      final response = await httpClient.get(
        Uri.parse('$baseUrl/albums')
            .replace(queryParameters: {'title': '$query'}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      Console.log("Endpoint: $baseUrl/albums?title=$query");

      if (response.statusCode == 200) {
        _data.dismissLoading();

        /// dismiss loading when response is successful
        Console.log("A1. Response from API: ${response.body}");
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        _data.dismissLoading();

        /// also dismiss loading when response is not successful
        Console.log("Status Code ${response.statusCode}: ${response.body}");
        switch (response.statusCode) {
          case 401:
            throw Exception('401 Unauthorized');
          case 400:
            throw Exception('400 Bad Request');
          case 404:
            throw Exception('404 Not Found');
          default:
            throw Exception(
                'Album list showing Failed (Status Code: ${response.statusCode})');
        }
      }
    } on Exception catch (error) {
      _data.dismissLoading();

      /// also dismiss loading when any error occurs
      showCustomToast(context, "${error.toString()}", "negative");
      throw Exception('An Error Occurred: ${error.toString()}');
    }
  }
}
