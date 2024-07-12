import 'package:flutter/cupertino.dart';
import 'package:mt_flutter_task/data/models/api_response_model.dart';

class PhotoDataProvider extends ChangeNotifier {
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

  bool get isListViewActive => _isListViewActive;

  bool get isGridViewActive => _isGridViewActive;

  bool get isLoading => _isLoading;

  bool get isDataEmpty => _isDataEmpty;

  bool get isSearchDataEmpty => _isSearchDataEmpty;

  ApiResponse? get apiResponse => _apiResponse;

  ApiResponse? get searchApiResponse => _searchApiResponse;

  String get searchQuery => _searchQuery;

  int get pageNo => _pageNo;

  bool get searchBoxVisibility => _searchBoxVisibility;

  /// to switch view between gridview and listview
  void switchView() {
    _isListViewActive = !_isListViewActive;
    _isGridViewActive = !_isGridViewActive;
    notifyListeners();
  }

  /// to toggle search box visibility when user clicks on it
  void toggleSearchBoxVisibility() {
    _searchQuery = '';
    _searchBoxVisibility = !searchBoxVisibility;
    notifyListeners();
  }

  /// to update the search text
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// navigate to next page
  void goNextPage() {
    _pageNo = pageNo + 1;
    notifyListeners();
  }

  /// navigate to previous page
  void goPreviousPage() {
    _pageNo = pageNo > 1 ? (pageNo - 1) : pageNo;
    notifyListeners();
  }

  /// to start loading animation
  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  /// to stop loading animation
  void dismissLoading() {
    _isLoading = false;
    notifyListeners();
  }

  /// to show empty item screen
  void setNoDataScreen() {
    _isLoading = false;
    _isDataEmpty = true;
    _apiResponse = null;
    notifyListeners();
  }

  /// to show empty searched item screen
  void setNoSearchedDataScreen() {
    _isSearchDataEmpty = true;
    _searchApiResponse = null;
    notifyListeners();
  }

  /// to populate view with response data
  void populateData(ApiResponse response) {
    _isDataEmpty = false;
    _isLoading = false;
    _apiResponse = response;
    notifyListeners();
  }

  /// to populate searched view with response data
  void populateSearchData(ApiResponse response) {
    _isSearchDataEmpty = false;
    _isLoading = false;
    _searchApiResponse = response;
    notifyListeners();
  }

  /// to initiate with default values that don't need to maintain on photo list
  /// screen
  void init() {
    _isLoading = true;
    _isDataEmpty = true;
    _isSearchDataEmpty = true;
    _apiResponse = null;
    _searchApiResponse = null;
    _searchQuery = '';
    _searchBoxVisibility = false;
    _pageNo = 1;
    notifyListeners();
  }
}
