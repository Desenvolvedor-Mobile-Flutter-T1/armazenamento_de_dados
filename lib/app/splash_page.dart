import 'package:armazenamento_de_dados/app/home_page.dart';
import 'package:armazenamento_de_dados/app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) async {
      await Future.delayed(Duration(seconds: 1));
      final logado = prefs.getBool('logado') ?? false;
      if (context.mounted) {
        if (logado) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
    return const Column(
      mainAxisAlignment: .center,
      children: [Center(child: CircularProgressIndicator())],
    );
  }
}
