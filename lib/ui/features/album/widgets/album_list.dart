import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/album_listview.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Widget albumList(
  BuildContext context,
  AlbumDataProvider data,
  AlbumViewModel viewModel,
  TextEditingController textEditingController,
) {
  return Visibility(
    visible: !data.searchQuery.isNotEmpty,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: data.isLoading
          ? const Loader(
              type: "on_center",
              color: primaryColor,
            )
          : (data.isDataEmpty
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2.3,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text(
                    "No Album found",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: fontL),
                    textAlign: TextAlign.center,
                  ),
                )
              : albumListView(context, viewModel, data, false)),
    ),
  );
}
