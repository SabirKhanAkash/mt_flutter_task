import 'package:flutter/cupertino.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Future<void> getAlbumList(BuildContext context, AlbumViewModel viewModel,
    AlbumDataProvider data, String? query) async {
  ApiResponse response;
  response = (query == null)
      ?

      /// if query params is null get album list response
      await viewModel.getAlbumList(context, data.pageNo)
      :

      /// if query params is not null get searched album list response
      await viewModel.getAlbumSearchList(context, data.searchQuery);

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
