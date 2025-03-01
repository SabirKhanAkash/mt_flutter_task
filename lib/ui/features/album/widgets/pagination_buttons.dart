import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/utils/get_album_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Widget paginationButtons(
  BuildContext context,
  AlbumDataProvider data,
  AlbumViewModel viewModel,
  TextEditingController textEditingController,
) {
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
            style: albumPrevButtonStyle(data),
            onPressed: () => {
              data.goPreviousPage(),
              data.pageNo >= 1
                  ? getAlbumList(context, viewModel, data, null)
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
          Text('Page ${data.pageNo} - 10 of 100',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: fontXXS)),
          ElevatedButton(
            style: albumNextButtonStyle(data),
            onPressed: () => data.pageNo < 10
                ? {
                    data.goNextPage(),
                    getAlbumList(context, viewModel, data, null)
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
