import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/data/providers/photo_data.dart';
import 'package:mt_flutter_task/data/repositories/photo_repository.dart';
import 'package:mt_flutter_task/ui/features/gallery/utils/get_photo_list.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/app_bar.dart';
import 'package:mt_flutter_task/ui/features/gallery/widgets/photo_body.dart';
import 'package:mt_flutter_task/utils/config.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/photo_view_model.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatefulWidget {
  final Data album;

  const PhotoScreen({super.key, required this.album});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late PhotoViewModel _viewModel;
  late PhotoDataProvider _data;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    /// initialize album viewmodel
    _viewModel = PhotoViewModel(
      PhotoRepository(baseUrl: getBaseUrl(), httpClient: http.Client()),
    );

    /// initialize album data provider
    _data = Provider.of<PhotoDataProvider>(context, listen: false);

    /// initialize text controller for search text
    _textEditingController = TextEditingController();

    /// reset pagination, searched results memory in provider
    Future.delayed(Duration.zero, () {
      _data.init();
    });

    /// call photo list api function
    getPhotoList(context, _viewModel, _data, null, widget.album.id);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  /// call photo list api function on pull down refresh gesture
  Future<void> _refresh() async {
    getPhotoList(context, _viewModel, _data, null, widget.album.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotoDataProvider>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: false,
        appBar: PhotoAppBar(widget.album, _viewModel, _textEditingController),
        body: RefreshIndicator(
            color: primaryColor,
            onRefresh: _refresh,
            child: photoBody(context, data, _viewModel, _textEditingController,
                widget.album.id)),
      );
    });
  }
}
