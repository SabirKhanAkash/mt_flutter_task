import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/utils/get_album_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Widget searchBar(
  BuildContext context,
  AlbumDataProvider data,
  AlbumViewModel viewModel,
  TextEditingController textEditingController,
) {
  return Container(
    padding: const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15),
    child: AnimatedOpacity(
      opacity: data.searchBoxVisibility ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: Visibility(
        maintainSize: false,
        maintainAnimation: false,
        visible: data.searchBoxVisibility,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
              controller: textEditingController,
              cursorColor: Colors.black,
              onChanged: (query) {
                data.updateSearchQuery(query);
                getAlbumList(context, viewModel, data, query);
              },
              decoration: searchBoxDecoration.copyWith(
                suffixIcon: data.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.black),
                        onPressed: () {
                          textEditingController.clear();
                          data.updateSearchQuery('');
                          getAlbumList(context, viewModel, data, null);
                        },
                      )
                    : null,
              ),
              style: const TextStyle(color: Colors.black)),
        ),
      ),
    ),
  );
}
