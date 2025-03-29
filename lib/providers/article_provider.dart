import 'package:quillhub/models/article.dart';
import 'package:quillhub/services/api/article_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_provider.g.dart';

@riverpod
class ArticleNotifier extends _$ArticleNotifier {

  final ArticleService _articleService = ArticleService();

  @override
  List<Article> build() {
    _fetchArticles();
    return [];
  }

  Future<void> _fetchArticles() async {
    state = await _articleService.getAllArticle();
  }

  Future<Article> getDetailArticle(int id) async {
    return await _articleService.getDetailArticle(id);
  }

}