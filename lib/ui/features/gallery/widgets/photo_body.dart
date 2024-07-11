import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/pagination_buttons.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/photo_list.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/search_bar.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/searched_photo_list.dart';
import 'package:mt_flutter_task/utils/footer.dart';
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
            searchBar(context, data, viewModel, textEditingController, albumId),
            paginationButtons(
                context, data, viewModel, textEditingController, albumId),
            photoList(context, data, viewModel, textEditingController),
            searchedPhotoList(context, data, viewModel, textEditingController),
            const Footer()
          ],
        ),
      )
    ],
  );
}
