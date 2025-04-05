import 'package:quillhub/models/article.dart';
import 'package:quillhub/services/api/article_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_provider.g.dart';

@riverpod
class ArticleNotifier extends _$ArticleNotifier {

  final ArticleService _articleService = ArticleService();

  int _currentPage = 1; // Tracking the pagination number
  List<Article> _loadedArticles = []; // Store the articles that have been loaded

  @override
  AsyncValue<List<Article>> build() {
    // Initial loading state
    return AsyncValue.loading();
  }

  // Function to load articles
  Future<void> loadArticles({int page = 1}) async {
    state = AsyncValue.loading();
    try {
      final articles = await _articleService.getAllArticle(page);

      // Append new articles to the existing list
      _loadedArticles.addAll(articles);
      _currentPage = page;
      state = AsyncValue.data(_loadedArticles); // Update the state with new articles
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // If error, update with error state
    }
  }

  // Function to load a specific article by its ID
  Future<AsyncValue<Article>> getDetailArticle(String id) async {
    try {
      final article = await _articleService.getDetailArticle(id);
      return AsyncValue.data(article);
    } catch (e, stackTrace) {
      return AsyncValue.error(e, stackTrace);
    }
  }

  // Call this method to fetch the next page of articles (pagination)
  Future<void> loadNextPage() async {
    _currentPage++;
    loadArticles(page: _currentPage);
  }
}