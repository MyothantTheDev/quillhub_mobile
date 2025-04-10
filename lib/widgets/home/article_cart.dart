import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/models/article.dart';
import 'package:quillhub/utils/core/constants.dart';

class ArticleCard extends ConsumerWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String image_url = '${Constants.postImage }${article.teaser!.image}';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image_url),
                      fit: BoxFit.cover
                  ),
                ),
            ),
            Container(
              height: 200,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withAlpha((255 * 0.7).floor())],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
              ),
              child: Text(
                  article.teaser?.title ?? 'No Title',
              ),
            )
          ],
        ),
      ),
    );
  }

}