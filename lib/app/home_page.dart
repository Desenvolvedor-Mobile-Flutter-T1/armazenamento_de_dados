import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: Column(
        spacing: 50,
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              Dio dio = Dio();
              final result = await dio.post(
                'https://dummyjson.com/auth/login',
                data: {"username": "emilys", "password": "emilyspass"},
              );
              print('#### API: $result');
              final secure = FlutterSecureStorage();
              await secure.write(
                key: 'authData',
                value: json.encode(result.data),
              );
            },
            child: Text('Consumir e salvar dados'),
          ),
          ElevatedButton(
            onPressed: () async {
              final secure = FlutterSecureStorage();
              final result = await secure.read(key: 'authData');
              log(json.decode(result!).toString());
            },
            child: Text('ler dados'),
          ),
        ],
      ),
    );
  }
}
