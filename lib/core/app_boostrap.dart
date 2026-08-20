import 'dart:async';

import 'package:armazenamento_de_dados/app/shared/database/db_helper.dart';
import 'package:armazenamento_de_dados/core/app_injection.dart';
import 'package:armazenamento_de_dados/core/app_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

void boostrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() async {
    Database database = await DbHelper.db;
    Dio dio = Dio();

    initInjection(database: database, dio: dio);

    runApp(AppWidget());
  }, (error, stack) {
    
  });
}
