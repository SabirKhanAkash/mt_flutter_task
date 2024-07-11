import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/utils/get_album_list.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/album_listview.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';

Widget AlbumBody(BuildContext context, AlbumDataProvider data,
    AlbumViewModel viewModel, TextEditingController textEditingController) {
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
                          getAlbumList(context, viewModel, data, query);
                        },
                        decoration: searchBoxDecoration.copyWith(
                          suffixIcon: data.searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear,
                                      color: Colors.black),
                                  onPressed: () {
                                    textEditingController.clear();
                                    data.updateSearchQuery('');
                                    getAlbumList(
                                        context, viewModel, data, null);
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
                            ? getAlbumList(context, viewModel, data, null)
                            : ()
                      },
                      child: const Text("Previous",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    Text('Page ${data.pageNo} - 10 of 100',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14)),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
                            (states) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9));
                        }),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>((states) {
                          if (data.pageNo == 10) {
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
                      onPressed: () => data.pageNo < 10
                          ? {
                              data.goNextPage(),
                              getAlbumList(context, viewModel, data, null)
                            }
                          : (),
                      child: const Text("Next",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
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
                                "No Album found",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : AlbumListView(context, viewModel, data, false))),
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
                                "No such album found, need to type the exact title",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : AlbumListView(context, viewModel, data, true))),
            ),
          ],
        ),
      )
    ],
  );
}
