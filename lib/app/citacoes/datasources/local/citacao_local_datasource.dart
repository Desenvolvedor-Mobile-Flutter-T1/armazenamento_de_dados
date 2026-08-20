import 'package:armazenamento_de_dados/app/citacoes/models/citacao_model.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class CitacaoLocalDatasource {
  Future<void> salvarCitacoes({required List<Citacao> citacoes});
}

final class CitacaoLocalDatasourceImpl implements CitacaoLocalDatasource {
  final Database _database;

  CitacaoLocalDatasourceImpl({required this._database});

  @override
  Future<void> salvarCitacoes({required List<Citacao> citacoes}) async {
    final batch = _database.batch();
    for (var element in citacoes) {
      batch.insert('quotes', element.toMap(), conflictAlgorithm: .replace);
    }

    batch.commit();
  }
}
