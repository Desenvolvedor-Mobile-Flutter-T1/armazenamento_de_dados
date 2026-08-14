import 'package:armazenamento_de_dados/app/shared/db_helper.dart';
import 'package:flutter/material.dart';

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
              final db = await DbHelper.db;
              await db.insert('QUOTES', {
                'id': 2,
                'quote': 'DEPENDE',
                'author': 'PROGRAMADOR',
              });
            },
            child: Text('CREATE'),
          ),
          ElevatedButton(
            onPressed: () async {
              final db = await DbHelper.db;
              final result = await db.rawQuery('SELECT * FROM QUOTES');
              print(result);
            },
            child: Text('READ'),
          ),
          ElevatedButton(
            onPressed: () async {
              final db = await DbHelper.db;
              await db.update(
                'QUOTES',
                {'AUTHOR': 'LUIZ'},
                where: 'id = ?',
                whereArgs: [2],
              );
            },
            child: Text('UPDATE'),
          ),
          ElevatedButton(
            onPressed: () async {
              final db = await DbHelper.db;
              await db.delete('QUOTES', where: "ID = ?", whereArgs: [1]);
            },
            child: Text('DELETE'),
          ),
        ],
      ),
    );
  }
}
