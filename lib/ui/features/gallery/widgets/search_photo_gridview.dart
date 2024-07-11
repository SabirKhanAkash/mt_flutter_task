import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/photo_grid_item.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';

Widget searchPhotoGridView(
    BuildContext context, PhotoDataProvider data, bool forSearch) {
  final response = forSearch ? data.searchApiResponse : data.apiResponse;
  final photos = response?.dataList ?? [];
  final crossAxisCount = 2;

  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
    child: data.isLoading
        ? const Loader(
            type: "on_center",
            color: primaryColor,
          )
        : data.isSearchDataEmpty
            ? Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2.3,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "No such photo found, need to type the exact title",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: fontM),
                  textAlign: TextAlign.center,
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.4),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  return PhotoGridItem(
                      context, photo, photos, crossAxisCount, index);
                },
              ),
  );
}
