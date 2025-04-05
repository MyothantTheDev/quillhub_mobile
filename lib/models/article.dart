import 'package:quillhub/models/base.dart';
import 'package:quillhub/models/api_response.dart';

enum ArticleBlockType { title, subtitle, image, paragraph }

class ArticleBlock {
  final ArticleBlockType type;
  final String? text;
  final String? image;
  final int? serial_number;

  ArticleBlock({required this.type, this.text, this.image, this.serial_number});

  factory ArticleBlock.fromJson(Map<String, dynamic> json) {
    final typeString = json['type'] as String?;
    final matchedType = ArticleBlockType.values.firstWhere(
        (e) => e.name == typeString,
        orElse: () => ArticleBlockType.paragraph
    );

    return ArticleBlock(
      type: matchedType,
      text: json['text'],
      image: json['imageUrl'],
      serial_number: json['serial_number']
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'type': type.toString().split('.').last,
      'text': text,
      'imageUrl': image,
      'serial_number': serial_number
    };
  }
}

class Article extends Model {
  final String? id;
  final List<ArticleBlock>? content;

  Article({this.id, this.content, this.error});

  factory Article.fromJson(Map<String, dynamic> json) {

    final blocks = (json['content'] as List).map((block) => ArticleBlock.fromJson(block)).toList();
    blocks.sort((a, b) => (a.serial_number ?? 0).compareTo(b.serial_number ?? 0));

    return Article(
      id: json['id'],
      content: blocks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content?.map((block) => block.toJson()).toList(),
    };
  }

  @override
  String? error;

  factory Article.errorCounter(ApiResponse response) {
    return Article(error: response.message);
  }

  bool get hasError => error != null;

  bool get isEmpty => content == null || content!.isEmpty;
}