import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/photo_screen.dart';
import 'package:mt_flutter_task/utils/console.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Widget AlbumListView(BuildContext context, AlbumViewModel viewModel,
    AlbumDataProvider data, bool forSearch) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: forSearch
        ? data.searchApiResponse?.dataList?.length ?? 0
        : data.apiResponse?.dataList?.length ?? 0,
    itemBuilder: (context, index) {
      Data? album = forSearch
          ? data.searchApiResponse?.dataList![index]
          : data.apiResponse?.dataList![index];
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              if (album != null) {
                Console.log("album: ${album.id}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoScreen(album: album),
                  ),
                );
              }
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    album?.title ?? 'N/A',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: fontS,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.folder_rounded,
                    color: primaryColor,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
