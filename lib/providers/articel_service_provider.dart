import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/services/api/article_service.dart';

final articleServiceProvider = Provider<ArticleService>((ref) {
  return ArticleService();
});
