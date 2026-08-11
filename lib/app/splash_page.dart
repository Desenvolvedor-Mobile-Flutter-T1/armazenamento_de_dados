import 'package:armazenamento_de_dados/app/home_page.dart';
import 'package:armazenamento_de_dados/app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage(
      aOptions: AndroidOptions.biometric(
        enforceBiometrics: true, // Requires biometric/PIN/pattern
        biometricPromptTitle: 'Mostra o dedo rapa!',
      ),
    );

    storage.read(key: 'ativo').then((resultado) async {
      await Future.delayed(Duration(seconds: 1));
      if (context.mounted) {
        if (resultado == 'farmador') {
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

      return;
    });

    return const Column(
      mainAxisAlignment: .center,
      children: [Center(child: CircularProgressIndicator())],
    );
  }
}
