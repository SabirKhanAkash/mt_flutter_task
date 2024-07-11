import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/utils/get_album_list.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';
import 'package:provider/provider.dart';

class AlbumAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AlbumViewModel albumViewModel;
  final TextEditingController textEditingController;

  const AlbumAppBar(this.albumViewModel, this.textEditingController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumDataProvider>(builder: (context, data, _) {
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
                title: const Text(
                  'MT Gallery App',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                actions: [
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.search_rounded,
                            size: 35, color: Colors.white),
                        onPressed: () {
                          textEditingController.clear();
                          data.toggleSearchBoxVisibility();
                          getAlbumList(context, albumViewModel, data, null);
                        },
                      ),
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
