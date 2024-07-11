import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/ui/features/gallery/photo_screen.dart';
import 'package:mt_flutter_task/utils/constants.dart';

Widget AlbumGridItem(BuildContext context, Data album, int crossAxisCount) {
  return GestureDetector(
    onTap: () {
      if (album != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoScreen(album: album),
          ),
        );
      }
    },
    child: Container(
      height: (MediaQuery.of(context).size.width / (crossAxisCount * 2)) - 25,
      width: (MediaQuery.of(context).size.width / (crossAxisCount * 2)) - 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.folder_rounded,
            color: primaryColor,
            size: 55,
          ),
          Text(
            album.title?.toString() ?? "Untitled",
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontSize: fontS,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
