import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/photo_listview.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/utils/loader.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';

Widget photoList(
  BuildContext context,
  PhotoDataProvider data,
  PhotoViewModel viewModel,
  TextEditingController textEditingController,
) {
  return Visibility(
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: const Text(
                      "No Photo found",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: fontL),
                      textAlign: TextAlign.center,
                    ),
                  )
                : PhotoListView(context, viewModel, data, false))),
  );
}
