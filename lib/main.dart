import 'package:armazenamento_de_dados/app/home_page.dart';
import 'package:armazenamento_de_dados/app/login_page.dart';
import 'package:armazenamento_de_dados/app/shared/db_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.db;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
