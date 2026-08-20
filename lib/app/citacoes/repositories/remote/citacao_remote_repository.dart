import 'package:armazenamento_de_dados/app/citacoes/datasources/remote/citacao_remote_datasource.dart';
import 'package:armazenamento_de_dados/app/citacoes/models/citacao_model.dart';

abstract interface class CitacaoRemoteRepository {
  Future<List<Citacao>> buscarCitacao();
}

final class CitacaoRemoteRepositoryImpl implements CitacaoRemoteRepository {
  final CitacaoRemoteDatasource remoteDatasource;

  CitacaoRemoteRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Citacao>> buscarCitacao() async {
    final maps = await remoteDatasource.buscarCitacoes();
    return maps.map((e) => Citacao.fromMap(e)).toList();
  }
}
