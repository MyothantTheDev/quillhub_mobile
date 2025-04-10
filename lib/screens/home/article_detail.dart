
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleDetail extends ConsumerStatefulWidget {
  String category;
  String id;
  ArticleDetail({super.key, required this.category, required this.id});

  @override
  ConsumerState<ArticleDetail> createState() => _ArticleDetailState();

}

class _ArticleDetailState extends ConsumerState<ArticleDetail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }

}