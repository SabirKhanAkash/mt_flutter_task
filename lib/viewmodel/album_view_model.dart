import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/repositories/album_repository.dart';

class AlbumViewModel {
  final AlbumRepository _albumRepository;

  AlbumViewModel(this._albumRepository);

  Future<ApiResponse> getAlbumList(BuildContext context, int? pageNo) async {
    return await _albumRepository.getAlbumList(context, pageNo);
  }

  Future<ApiResponse> getAlbumSearchList(
      BuildContext context, String? query) async {
    return await _albumRepository.getAlbumSearchList(context, query);
  }
}
