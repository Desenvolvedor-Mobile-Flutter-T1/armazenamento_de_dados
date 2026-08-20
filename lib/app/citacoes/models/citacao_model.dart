// ignore_for_file: public_member_api_docs, sort_constructors_first

class Citacao {
  final int id;
  final String citacao;
  final String author;

  Citacao({required this.id, required this.citacao, required this.author});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'quote': citacao, 'author': author};
  }

  factory Citacao.fromMap(Map<String, dynamic> map) {
    return Citacao(
      id: map['id'] as int,
      citacao: map['quote'] as String,
      author: map['author'] as String,
    );
  }
}
