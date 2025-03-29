import 'package:quillhub/models/article.dart';
import 'package:quillhub/services/api/api_service.dart';
import 'package:quillhub/utils/core/constants.dart';

class ArticleService {
  late ApiService _apiService;

  ArticleService() {
    _apiService = ApiService();
  }

  Future<List<Article>> getAllArticle() async {
    List<Article> allArticles = [];
    final response = await _apiService.getRequest(
      Constants.postURL,
      {'Accept': 'application/json'}
    );
    if (response.data != null && response.data is List<dynamic>) {
      for(final item in response.data as List<dynamic>) {
        allArticles.add(Article.fromJson(item as Map<String, dynamic>));
      }
      return allArticles;
    }
    allArticles.add(Article.errorCounter(response));
    return allArticles;
  }

  Future<Article> getDetailArticle(int id) async {
    final response = await _apiService.getRequest(
      '${Constants.postURL}/$id',
      {'Accept': 'application/json'}
    );
    if (response.error != null) {
      return Article.errorCounter(response);
    }
    return Article.fromJson(response.data as Map<String, dynamic>);
  }

}