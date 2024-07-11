import 'package:flutter/cupertino.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';

class AlbumDataProvider extends ChangeNotifier {
  bool _isLoading = true,
      _isDataEmpty = true,
      _isSearchDataEmpty = true,
      _isListViewActive = true,
      _isGridViewActive = false;
  ApiResponse? _apiResponse = null;
  ApiResponse? _searchApiResponse = null;
  String _searchQuery = '';
  bool _searchBoxVisibility = false;
  int _pageNo = 1;

  bool get isLoading => _isLoading;

  bool get isListViewActive => _isListViewActive;

  bool get isGridViewActive => _isGridViewActive;

  bool get isDataEmpty => _isDataEmpty;

  bool get isSearchDataEmpty => _isSearchDataEmpty;

  ApiResponse? get apiResponse => _apiResponse;

  ApiResponse? get searchApiResponse => _searchApiResponse;

  String get searchQuery => _searchQuery;

  int get pageNo => _pageNo;

  bool get searchBoxVisibility => _searchBoxVisibility;

  void switchView() {
    _isListViewActive = !_isListViewActive;
    _isGridViewActive = !_isGridViewActive;
    notifyListeners();
  }

  void toggleSearchBoxVisibility() {
    _searchQuery = '';
    _searchBoxVisibility = !searchBoxVisibility;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void goNextPage() {
    _pageNo = pageNo + 1;
    notifyListeners();
  }

  void goPreviousPage() {
    _pageNo = pageNo > 1 ? (pageNo - 1) : pageNo;
    notifyListeners();
  }

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void dismissLoading() {
    _isLoading = false;
    notifyListeners();
  }

  void setNoDataScreen() {
    _isLoading = false;
    _isDataEmpty = true;
    _apiResponse = null;
    notifyListeners();
  }

  void setNoSearchedDataScreen() {
    _isSearchDataEmpty = true;
    _searchApiResponse = null;
    notifyListeners();
  }

  void populateData(ApiResponse response) {
    _isDataEmpty = false;
    _isLoading = false;
    _apiResponse = response;
    notifyListeners();
  }

  void populateSearchData(ApiResponse response) {
    _isSearchDataEmpty = false;
    _isLoading = false;
    _searchApiResponse = response;
    notifyListeners();
  }
}
