import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/album_grid_item.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';

Widget albumGridView(
    BuildContext context, AlbumDataProvider data, bool forSearch) {
  final response = forSearch ? data.searchApiResponse : data.apiResponse;
  final albums = response?.dataList ?? [];
  final crossAxisCount = 2;

  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
    child: Visibility(
      visible: !data.searchQuery.isNotEmpty,
      child: data.isLoading
          ? const Loader(
              type: "on_center",
              color: primaryColor,
            )
          : data.isDataEmpty
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
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.4),
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    final album = albums[index];
                    return albumGridItem(context, album, crossAxisCount);
                  },
                ),
    ),
  );
}
