import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/album_list.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/pagination_buttons.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/search_bar.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/searched_album_list.dart';
import 'package:mt_flutter_task/utils/footer.dart';
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
            searchBar(context, data, viewModel, textEditingController),
            paginationButtons(context, data, viewModel, textEditingController),
            albumList(context, data, viewModel, textEditingController),
            searchedAlbumList(context, data, viewModel, textEditingController),
            const Footer()
          ],
        ),
      )
    ],
  );
}
