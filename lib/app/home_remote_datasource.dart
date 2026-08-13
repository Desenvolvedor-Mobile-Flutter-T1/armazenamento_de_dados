import 'package:armazenamento_de_dados/app/citacao_model.dart';
import 'package:dio/dio.dart';

class HomeRemoteDatasource {
  Future<List<CitacaoModel>> buscarCitacoes() async {
    try {
      Dio dio = Dio();
      final result = await dio.get('https://dummyjson.com/quotes');
      return (result.data['quotes'] as Iterable).map((e) {
        return CitacaoModel.fromMap(e);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
