import 'package:armazenamento_de_dados/app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nome = '';

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      final result = value.getString('nome') ?? 'Sem nome';
      setState(() {
        nome = result;
      });
    });
    return Scaffold(
      appBar: AppBar(title: Text('Home - $nome'), centerTitle: true),
      body: Column(
        spacing: 50,
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              await prefs.remove('logado');
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashPage()),
                );
              }
            },
            child: Text('Deletar'),
          ),
        ],
      ),
    );
  }
}
