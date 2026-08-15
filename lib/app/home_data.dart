import 'package:armazenamento_de_dados/app/quote_model.dart';
import 'package:armazenamento_de_dados/app/shared/db_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeData extends ChangeNotifier {
  List<QuoteModel> quotes = [];
  bool isLoading = false;
  Future<void> scriptzaoDoPoder() async {
    isLoading = true;
    notifyListeners();
    await _clearTable();
    final apiResult = await _getDataFromAPI();
    await _saveData(quotes: apiResult);
    final quotesFromDB = await _getDataFromDB();
    isLoading = false;
    quotes = quotesFromDB;
    notifyListeners();
  }

  Future<List<QuoteModel>> _getDataFromAPI() async {
    Dio dio = Dio();
    final result = await dio.get('https://dummyjson.com/quotes');
    return (result.data['quotes'] as Iterable)
        .map((e) => QuoteModel.fromMap(e))
        .toList();
  }

  Future<void> _saveData({required List<QuoteModel> quotes}) async {
    final db = await DbHelper.db;
    for (var element in quotes) {
      await db.insert('QUOTES', element.toMap());
    }
  }

  Future<List<QuoteModel>> _getDataFromDB() async {
    final db = await DbHelper.db;
    final result = await db.rawQuery('SELECT * FROM QUOTES');
    return result.map((e) => QuoteModel.fromMap(e)).toList();
  }

  Future<void> _clearTable() async {
    final db = await DbHelper.db;

    await db.delete('QUOTES');
  }

  Future<void> updateDataAndRefresh({required QuoteModel quote}) async {
    isLoading = true;
    final db = await DbHelper.db;
    await db.update(
      'QUOTES',
      quote.toMap(),
      where: "id = ?",
      whereArgs: [quote.id],
    );
    final newQuotes = await _getDataFromDB();

    quotes = newQuotes;
    isLoading = false;
    notifyListeners();
  }
}
