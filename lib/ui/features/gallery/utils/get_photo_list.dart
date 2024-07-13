import 'package:flutter/cupertino.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Future<void> getPhotoList(BuildContext context, PhotoViewModel viewModel,
    PhotoDataProvider data, String? query, int? albumId) async {
  ApiResponse response;
  response = (query == null)
      ?

      /// if query params is null get photo list response
      await viewModel.getPhotoList(context, data.pageNo, albumId)
      :

      /// if query params is not null get searched photo list response
      await viewModel.getPhotoSearchList(context, data.searchQuery, albumId);

  if (response.dataList != null) {
    /// if response is not empty update view with data
    if (response.dataList!.isNotEmpty) {
      (query == null)
          ? data.populateData(response)
          : data.populateSearchData(response);
    }

    /// if response is empty update view with empty screen
    else {
      (query == null) ? data.setNoDataScreen() : data.setNoSearchedDataScreen();
    }
  }

  /// if response is empty update view with empty screen
  else {
    (query == null) ? data.setNoDataScreen() : data.setNoSearchedDataScreen();
  }
}
