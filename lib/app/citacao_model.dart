// ignore_for_file: public_member_api_docs, sort_constructors_first
class CitacaoModel {
  final int id;
  final String texto;
  final String autor;
  CitacaoModel({required this.id, required this.texto, required this.autor});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'texto': texto, 'autor': autor};
  }

  factory CitacaoModel.fromMap(Map<String, dynamic> map) {
    return CitacaoModel(
      id: map['id'] as int,
      texto: map['quote'] as String,
      autor: map['author'] as String,
    );
  }
}
