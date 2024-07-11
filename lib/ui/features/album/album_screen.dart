import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mt_flutter_task/data/providers/album_data.dart';
import 'package:mt_flutter_task/data/repositories/album_repository.dart';
import 'package:mt_flutter_task/ui/features/album/utils/get_album_list.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/album_body.dart';
import 'package:mt_flutter_task/ui/features/album/widgets/app_bar.dart';
import 'package:mt_flutter_task/utils/config.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:mt_flutter_task/viewmodel/album_view_model.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late AlbumViewModel _viewModel;
  late AlbumDataProvider _data;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _viewModel = AlbumViewModel(
      AlbumRepository(baseUrl: getBaseUrl(), httpClient: http.Client()),
    );
    _data = Provider.of<AlbumDataProvider>(context, listen: false);
    _textEditingController = TextEditingController();
    getAlbumList(context, _viewModel, _data, null);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    getAlbumList(context, _viewModel, _data, null);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumDataProvider>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: false,
        appBar: AlbumAppBar(_viewModel, _textEditingController),
        body: RefreshIndicator(
            color: primaryColor,
            onRefresh: _refresh,
            child:
                AlbumBody(context, data, _viewModel, _textEditingController)),
      );
    });
  }
}
