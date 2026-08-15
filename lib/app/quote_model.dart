// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuoteModel {
  final int id;
  final String quote;
  final String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  @override
  String toString() => 'QuoteModel(id: $id, quote: $quote, author: $author)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'quote': quote, 'author': author};
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id'] as int,
      quote: map['quote'] as String,
      author: map['author'] as String,
    );
  }

  QuoteModel copyWith({int? id, String? quote, String? author}) {
    return QuoteModel(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }
}
