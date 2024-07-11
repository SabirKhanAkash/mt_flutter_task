import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/utils/get_photo_list.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/photo_listview.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Widget PhotoBody(
    BuildContext context,
    PhotoDataProvider data,
    PhotoViewModel viewModel,
    TextEditingController textEditingController,
    int? albumId) {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 15, right: 15),
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
                          getPhotoList(
                              context, viewModel, data, query, albumId);
                        },
                        decoration: searchBoxDecoration.copyWith(
                          suffixIcon: data.searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear,
                                      color: Colors.black),
                                  onPressed: () {
                                    textEditingController.clear();
                                    data.updateSearchQuery('');
                                    getPhotoList(context, viewModel, data, null,
                                        albumId);
                                  },
                                )
                              : null,
                        ),
                        style: const TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !data.searchQuery.isNotEmpty,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                            (states) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9));
                        }),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>((states) {
                          if (data.pageNo == 1) {
                            return lightGray;
                          } else {
                            if (states.contains(WidgetState.pressed)) {
                              return primaryDarkColor;
                            } else {
                              return primaryColor;
                            }
                          }
                        }),
                      ),
                      onPressed: () => {
                        data.goPreviousPage(),
                        data.pageNo >= 1
                            ? getPhotoList(
                                context, viewModel, data, null, albumId)
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
                            size: 20,
                          ),
                          Text("Prev",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontXS)),
                        ],
                      ),
                    ),
                    Text('Page ${data.pageNo} - 5 of 50',
                        style: const TextStyle(
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                            fontSize: fontXXS)),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                            (states) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9));
                        }),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>((states) {
                          if (data.pageNo == 5) {
                            return lightGray;
                          } else {
                            if (states.contains(WidgetState.pressed)) {
                              return primaryDarkColor;
                            } else {
                              return primaryColor;
                            }
                          }
                        }),
                      ),
                      onPressed: () => data.pageNo < 5
                          ? {
                              data.goNextPage(),
                              getPhotoList(
                                  context, viewModel, data, null, albumId)
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontXS)),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !data.searchQuery.isNotEmpty,
              child: SizedBox(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: const Text(
                                "No Photo found",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: fontL),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : PhotoListView(context, viewModel, data, false))),
            ),
            Visibility(
              visible: data.searchQuery.isNotEmpty,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: data.isLoading
                      ? const Loader(
                          type: "on_center",
                          color: primaryColor,
                        )
                      : (data.isSearchDataEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 2.3,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: const Text(
                                "No such photo found, need to type the exact title",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: fontM),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : PhotoListView(context, viewModel, data, true))),
            ),
          ],
        ),
      )
    ],
  );
}
