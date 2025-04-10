import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/article_provider.dart';
import 'package:quillhub/providers/category_provider.dart';
import 'package:quillhub/widgets/home/article_cart.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  final ScrollController _scrollController = ScrollController();
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double currentPosition = _scrollController.offset;
    double maxPosition = _scrollController.position.maxScrollExtent - 100;
    if (currentPosition >= maxPosition && !_isloading) {
      _loadMoreArticles();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreArticles() async {
    setState(() => _isloading = true);
    ref.read(articleNotifierProvider.notifier).loadNextPage();
    setState(() => _isloading = false);

  }

  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider);
    final articles = ref.watch(articleNotifierProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(articleNotifierProvider.notifier).refreshArticles();
        return Future<void>.delayed(const Duration(seconds: 2));
      },
      child: ListView.separated(
          controller: _scrollController,
          itemCount: articles.length + (_isloading ? 1 : 0),
          itemBuilder: (context, index) {

            if (index == articles.length) {
              return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
              );
            }

            final article = articles[index];
            return ArticleCard(article: article);
          },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
      ),
    );
  }

}