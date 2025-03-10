import 'package:quillhub/models/base.dart';
import 'package:quillhub/services/api_response.dart';

enum ArticleBlockType { title, subtitle, image, paragraph }

class ArticleBlock {
  final ArticleBlockType type;
  final String? text;
  final String? imageUrl;
  final int? serial_number;

  ArticleBlock({required this.type, this.text, this.imageUrl, this.serial_number});

  factory ArticleBlock.fromJson(Map<String, dynamic> json) {
    return ArticleBlock(
      type: ArticleBlockType.values.firstWhere((e) => e.toString() == 'ArticleBlockType.${json['type']}'),
      text: json['text'],
      imageUrl: json['imageUrl'],
      serial_number: json['serial_number']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'text': text,
      'imageUrl': imageUrl,
      'serial_number': serial_number
    };
  }
}

class Article extends Model {
  final String? id;
  final List<ArticleBlock>? content;

  Article({this.id, this.content, this.error});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      content: (json['content'] as List).map((block) => ArticleBlock.fromJson(block)).toList(),
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
    return Article(error: response.error);
  }
}