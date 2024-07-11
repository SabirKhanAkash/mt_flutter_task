import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Widget PhotoListView(BuildContext context, PhotoViewModel viewModel,
    PhotoDataProvider data, bool forSearch) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: forSearch
        ? data.searchApiResponse?.dataList?.length ?? 0
        : data.apiResponse?.dataList?.length ?? 0,
    itemBuilder: (context, index) {
      final photo = forSearch
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
              // TBD
              // if (photo != null) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => PhotoPreviewScreen(
              //           photos: forSearch
              //               ? data.searchApiResponse?.dataList
              //               : data.apiResponse?.dataList),
              //     ),
              //   );
              // }
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    photo?.title ?? 'N/A',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 0.75),
                      image: DecorationImage(
                        filterQuality: FilterQuality.low,
                        image:
                            NetworkImage("${photo?.thumbnailUrl?.toString()}"),
                        // setting profile picture from API response
                        fit: BoxFit.scaleDown,
                      ),
                    ),
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
