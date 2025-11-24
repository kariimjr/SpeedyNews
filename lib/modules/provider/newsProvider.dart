import 'package:flutter/material.dart';
import '../../core/api/apiManager.dart';
import '../../core/api/models/news_response.dart';
import '../../core/constant/catageories/catageories.dart';

class NewsProvider with ChangeNotifier {
  Catageories? _selectedCategory;
  Source? _selectedSource;
  List<Source> _sources = [];
  List<Articles> _articles = [];

  Catageories? get selectedCategory => _selectedCategory;
  Source? get selectedSource => _selectedSource;
  List<Source> get sources => _sources;
  List<Articles> get articles => _articles;

  Future<void> setCategory(Catageories category) async {
    _selectedCategory = category;
    _sources = await ApiManager.getSources(category.id);
    _selectedSource = _sources.isNotEmpty ? _sources.first : null;
    if (_selectedSource != null) {
      _articles = await ApiManager.getNews(_selectedSource!.id!);
    } else {
      _articles = [];
    }
    notifyListeners();
  }

  Future<void> setSource(Source source) async {
    _selectedSource = source;
    _articles = await ApiManager.getNews(source.id!);
    notifyListeners();
  }

  void resetCategory() {
    _selectedCategory = null;
    _selectedSource = null;
    _sources = [];
    _articles = [];
    notifyListeners();
  }
}
