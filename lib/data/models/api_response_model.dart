import 'package:mt_flutter_task/data/models/data_model.dart';

class ApiResponse {
  List<Data>? dataList;

  /// for list response
  Data? data;

  /// for object response

  ApiResponse({this.dataList, this.data});

  /// to process the json response and send to viewmodel
  factory ApiResponse.fromJson(dynamic json) {
    if (json is List) {
      List<Data> dataList = json.map((e) => Data.fromJson(e)).toList();
      return ApiResponse(dataList: dataList);
    } else if (json is Map) {
      return ApiResponse(data: Data.fromJson(json));
    }
    return ApiResponse(
      dataList: null,
      data: null,
    );
  }
}
