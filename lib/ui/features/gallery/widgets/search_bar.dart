import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/utils/get_photo_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Widget searchBar(
    BuildContext context,
    PhotoDataProvider data,
    PhotoViewModel viewModel,
    TextEditingController textEditingController,
    int? albumId) {
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
                getPhotoList(context, viewModel, data, query, albumId);
              },
              decoration: searchBoxDecoration.copyWith(
                suffixIcon: data.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.black),
                        onPressed: () {
                          /// to clear the text controller
                          textEditingController.clear();

                          /// to clear the search query
                          data.updateSearchQuery('');

                          /// to call photo list api function
                          getPhotoList(context, viewModel, data, null, albumId);
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
