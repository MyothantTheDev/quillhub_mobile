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

class Teaser extends Model {
  final String? title;
  final String? image;
  final String? text;

  Teaser({this.title, this.image, this.text, this.error});

  factory Teaser.fromJson(Map<String, dynamic> json) {

    return Teaser(
      title: json['title'],
      image: json['image'],
      text: json['text']
    );
  }

  @override
  String? error;
  factory Teaser.errorCounter(ApiResponse response) {

    return Teaser(error: response.message);
  }
}

class Article extends Model {
  final String? id;
  final List<ArticleBlock>? content;
  final int? likes;
  final Teaser? teaser;

  Article({this.id, this.content, this.error, this.likes, this.teaser});

  factory Article.fromJson(Map<String, dynamic> json) {

    final blocks = (json['content'] as List).map((block) => ArticleBlock.fromJson(block)).toList();
    blocks.sort((a, b) => (a.serial_number ?? 0).compareTo(b.serial_number ?? 0));

    return Article(
      id: json['_id']['\$oid'],
      content: blocks,
      likes: json['likes'],
    );
  }

  factory Article.fromJsonWithTeaser(Map<String, dynamic> json) {

    final rawTeaser = Teaser.fromJson(json['teaser'] as Map<String, dynamic>);

    return Article(
      id: json['_id']['\$oid'],
      likes: json['likes'],
      teaser: rawTeaser
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