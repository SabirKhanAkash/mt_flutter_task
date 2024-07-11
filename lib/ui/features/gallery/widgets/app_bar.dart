import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/utils/get_photo_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';
import 'package:provider/provider.dart';

class PhotoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PhotoViewModel photoViewModel;
  final TextEditingController textEditingController;
  final Data album;

  const PhotoAppBar(this.album, this.photoViewModel, this.textEditingController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotoDataProvider>(builder: (context, data, _) {
      return PreferredSize(
        preferredSize: Size.fromHeight(preferredSize.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
                backgroundColor: primaryColor,
                elevation: 0,
                toolbarHeight: 80,
                centerTitle: false,
                title: SelectableText(
                  cursorColor: primaryColor,
                  album.title ?? "Untitled",
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: fontM,
                      overflow: TextOverflow.ellipsis),
                ),
                leading: GestureDetector(
                    onTap: () async {
                      Navigator.pop(context); // Open drawer on tap
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                          data.isGridViewActive
                              ? Icons.format_list_bulleted
                              : Icons.grid_view_rounded,
                          color: Colors.white),
                      onPressed: () {
                        data.switchView();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.search_rounded,
                          size: data.searchBoxVisibility ? 40 : 35,
                          color: Colors.white),
                      onPressed: () {
                        textEditingController.clear();
                        data.toggleSearchBoxVisibility();
                        getPhotoList(context, photoViewModel, data, null,
                            album.id?.toInt());
                      },
                    ),
                  ),
                ]),
            const Divider(
              height: 1,
              color: lightGray,
            ),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(81);
}
