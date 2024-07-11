import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';
import 'package:mt_flutter_task/data/repositories/photo_repository.dart';

class PhotoViewModel {
  final PhotoRepository _photoRepository;

  PhotoViewModel(this._photoRepository);

  Future<ApiResponse> getPhotoList(
      BuildContext context, int? pageNo, int? albumId) async {
    return await _photoRepository.getPhotoList(context, pageNo, albumId);
  }

  Future<ApiResponse> getPhotoSearchList(
      BuildContext context, String? query, int? albumId) async {
    return await _photoRepository.getPhotoSearchList(context, query, albumId);
  }
}
