import 'package:flutter/material.dart';
import '../../core/api/apiManager.dart';
import '../../core/api/models/news_response.dart';
import '../../core/constant/catageories/catageories.dart';

class NewsProvider with ChangeNotifier {
  Catageories? _selectedCategory;
  Source? _selectedSource;
  List<Source> _sources = [];
  List<Articles> _allArticles = []; // Keep all articles
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
      _allArticles = await ApiManager.getNews(_selectedSource!.id!);
      _articles = List.from(_allArticles); // Initially show all
    } else {
      _allArticles = [];
      _articles = [];
    }
    notifyListeners();
  }

  Future<void> setSource(Source source) async {
    _selectedSource = source;
    _allArticles = await ApiManager.getNews(source.id!);
    _articles = List.from(_allArticles);
    notifyListeners();
  }

  void resetCategory() {
    _selectedCategory = null;
    _selectedSource = null;
    _sources = [];
    _allArticles = [];
    _articles = [];
    notifyListeners();
  }

  void searchNews(String query) {
    if (query.isEmpty) {
      _articles = List.from(_allArticles); // Reset to all articles
    } else {
      _articles = _allArticles
          .where((article) =>
          article.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void resetSearch() {
    _articles = List.from(_allArticles);
    notifyListeners();
  }
}
