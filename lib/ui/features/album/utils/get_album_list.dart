import 'package:flutter/cupertino.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Future<void> getAlbumList(BuildContext context, AlbumViewModel viewModel,
    AlbumDataProvider data, String? query) async {
  ApiResponse response;
  response = (query == null)
      ? await viewModel.getAlbumList(context, data.pageNo)
      : await viewModel.getAlbumSearchList(context, data.searchQuery);

  if (response.dataList != null) {
    if (response.dataList!.isNotEmpty) {
      (query == null)
          ? data.populateData(response)
          : data.populateSearchData(response);
    } else {
      (query == null) ? data.setNoDataScreen() : data.setNoSearchedDataScreen();
    }
  } else {
    (query == null) ? data.setNoDataScreen() : data.setNoSearchedDataScreen();
  }
}
