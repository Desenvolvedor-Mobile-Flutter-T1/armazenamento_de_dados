import 'package:armazenamento_de_dados/app/citacao_model.dart';
import 'package:armazenamento_de_dados/app/home_remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class HomeViewmodel extends ChangeNotifier {
  final _datasource = HomeRemoteDatasource();

  List<CitacaoModel> citacoes = [];
  List<CitacaoModel> _citacoesOriginal = [];

  bool loading = false;
  late Box<CitacaoModel> _citacoesBox;

  Future<void> buscarCitacoes() async {
    loading = true;
    notifyListeners();
    final result = await _datasource.buscarCitacoes();
    if (result.isEmpty) return;

    _citacoesBox = await Hive.openBox<CitacaoModel>('citacoes');
    await _citacoesBox.clear();
    _citacoesBox.addAll(result);

    loading = false;
    _citacoesOriginal = _citacoesBox.values.toList();
    citacoes = _citacoesOriginal;
    notifyListeners();
  }

  Future<void> filtrarPorId({required int id}) async {
    if (!Hive.isBoxOpen('citacoes')) {
      _citacoesBox = await Hive.openBox<CitacaoModel>('citacoes');
    }
    loading = true;
    notifyListeners();
    citacoes.clear();
    citacoes = _citacoesBox.values
        .where((element) => element.id == id)
        .toList();
    loading = false;
    notifyListeners();
  }
}
