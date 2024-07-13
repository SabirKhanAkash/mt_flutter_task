import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/ui/features/gallery/photo_list_preview_screen.dart';
import 'package:mt_flutter_task/utils/constants.dart';

Widget photoGridItem(BuildContext context, Data photo, List<Data>? photos,
    int crossAxisCount, int startingIndex) {
  return GestureDetector(
    onTap: () {
      if (photos != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            /// navigate to photo preview screen with all photos for swiping
            builder: (context) => PhotoListPreviewScreen(
              images: photos,
              startingIndex: startingIndex,
            ),
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
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 0.75),
              image: DecorationImage(
                filterQuality: FilterQuality.low,
                image: NetworkImage("${photo.thumbnailUrl?.toString()}"),
                // setting profile picture from API response
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Text(
            photo.title?.toString() ?? "Untitled",
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
