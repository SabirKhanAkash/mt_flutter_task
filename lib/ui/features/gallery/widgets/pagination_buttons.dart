import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/utils/get_photo_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Widget paginationButtons(
    BuildContext context,
    PhotoDataProvider data,
    PhotoViewModel viewModel,
    TextEditingController textEditingController,
    int? albumId) {
  return Visibility(
    visible: !data.searchQuery.isNotEmpty,
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            style: photoPrevButtonStyle(data),
            onPressed: () => {
              data.goPreviousPage(),
              data.pageNo >= 1
                  ? getPhotoList(context, viewModel, data, null, albumId)
                  : ()
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 15,
                ),
                Text("Prev",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: fontXS)),
              ],
            ),
          ),
          Text('Page ${data.pageNo} - 5 of 50',
              style: const TextStyle(
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: fontXXS)),
          ElevatedButton(
            style: photoNextButtonStyle(data),
            onPressed: () => data.pageNo < 5
                ? {
                    data.goNextPage(),
                    getPhotoList(context, viewModel, data, null, albumId)
                  }
                : (),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Next",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: fontXS)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
