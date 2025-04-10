import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/models/article.dart';
import 'package:quillhub/providers/articel_service_provider.dart';

final articleNotifierProvider = StateNotifierProvider<ArticleNotifier, List<Article>>(
      (ref) => ArticleNotifier(ref),
);

class ArticleNotifier extends StateNotifier<List<Article>> {
  final Ref ref;
  int _currentPage = 1;
  bool _isFetching = false;
  bool _hasMore = true;

  ArticleNotifier(this.ref) : super([]) {
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (_isFetching || !_hasMore) return;
    _isFetching = true;

    try {

      final newArticles = await ref.read(articleServiceProvider).getAllArticle(_currentPage);
      print('                       API FETCHING ARTICLE LEN                       ');
      print('----------------------------------------------------------------------');
      print('ARTICLE LENGTH: ${newArticles.length}');
      print('----------------------------------------------------------------------');
      if (newArticles.isEmpty) {
        _hasMore = false;
      } else {
        state = [...state, ...newArticles];
        _currentPage++;
      }

    } catch (e) {

      print('                       ERROR WHILE API FETCHING                       ');
      print('----------------------------------------------------------------------');
      print('Error api fetching: \n$e');
      print('----------------------------------------------------------------------');

    } finally {
      _isFetching = false;
    }

  }

  Future<void> refreshArticles() async {
    _currentPage = 1;
    _hasMore = true;

    final newArticles = await ref.read(articleServiceProvider).getAllArticle(_currentPage);
    state = [...newArticles];
    _currentPage++;
  }
}
