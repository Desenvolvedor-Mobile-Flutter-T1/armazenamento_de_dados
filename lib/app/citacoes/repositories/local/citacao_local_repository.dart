import 'package:armazenamento_de_dados/app/citacoes/datasources/local/citacao_local_datasource.dart';
import 'package:armazenamento_de_dados/app/citacoes/models/citacao_model.dart';

abstract interface class CitacaoLocalRepository {
  CitacaoLocalRepository();

  Future<void> salvarCitacoes({required List<Citacao> citacoes});
}

class CitacaoLocalRepositoryImpl extends CitacaoLocalRepository {
  final CitacaoLocalDatasource localDatasource;

  CitacaoLocalRepositoryImpl({required this.localDatasource});

  @override
  Future<void> salvarCitacoes({required List<Citacao> citacoes}) async {
    return localDatasource.salvarCitacoes(citacoes: citacoes);
  }
}
