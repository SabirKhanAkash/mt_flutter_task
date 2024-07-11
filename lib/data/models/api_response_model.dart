import 'package:mt_flutter_task/data/models/data_model.dart';

class ApiResponse {
  List<Data>? dataList;
  Data? data;

  ApiResponse({this.dataList, this.data});

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
