import 'package:dio/dio.dart';

abstract interface class CitacaoRemoteDatasource {
  Future<List<Map<String, dynamic>>> buscarCitacoes();
}

final class CitacaoRemoteDatasourceImpl extends CitacaoRemoteDatasource {
  final Dio dio;

  CitacaoRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<Map<String, dynamic>>> buscarCitacoes() async {
    try {
      final result = await dio.get('https://dummyjson.com/quotes');
      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}
