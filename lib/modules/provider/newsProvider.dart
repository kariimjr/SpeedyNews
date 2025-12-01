import 'package:flutter/material.dart';
import '../../core/api/apiManager.dart';
import '../../core/api/models/news_response.dart';
import '../../core/constant/catageories/catageories.dart';

class NewsProvider with ChangeNotifier {


  Catageories? _selectedCategory;
  Source? _selectedSource;

  List<Source> _sources = [];
  List<Articles> _allArticles = [];
  List<Articles> _articles = [];

  List<String> _titles = [];


  Catageories? get selectedCategory => _selectedCategory;
  Source? get selectedSource => _selectedSource;

  List<Source> get sources => _sources;
  List<Articles> get articles => _articles;

  // CATEGORY SELECTION

  Future<void> setCategory(Catageories category) async {
    _selectedCategory = category;

    _sources = await ApiManager.getSources(category.id);
    _selectedSource = _sources.isNotEmpty ? _sources.first : null;

    if (_selectedSource != null) {
      await _loadArticles(_selectedSource!.id!);
    } else {
      _clearArticles();
    }

    notifyListeners();
  }

  // SOURCE SELECTION

  Future<void> setSource(Source source) async {
    _selectedSource = source;
    await _loadArticles(source.id!);
    notifyListeners();
  }

  //  LOAD ARTICLES

  Future<void> _loadArticles(String sourceId) async {
    _allArticles = await ApiManager.getNews(sourceId);
    _articles = List.from(_allArticles);

    // Extract titles for auto-suggestions
    _titles = _allArticles
        .map((a) => a.title ?? "")
        .where((t) => t.trim().isNotEmpty)
        .toList();
  }

  // RESET

  void resetCategory() {
    _selectedCategory = null;
    _selectedSource = null;
    _sources = [];
    _clearArticles();
    notifyListeners();
  }

  void _clearArticles() {
    _allArticles = [];
    _articles = [];
    _titles = [];
  }

  // SEARCH

  void searchNews(String query) {
    if (query.isEmpty) {
      _articles = List.from(_allArticles);
    } else {
      _articles = _allArticles
          .where((article) =>
          (article.title ?? "").toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void resetSearch() {
    _articles = List.from(_allArticles);
    notifyListeners();
  }

  // AUTO-SUGGESTIONS

  List<String> getSuggestions(String query) {
    if (query.isEmpty) return [];

    return _titles
        .where((title) =>
        title.toLowerCase().contains(query.toLowerCase()))
        .take(6) // limit suggestions
        .toList();
  }
}
