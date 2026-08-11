import 'package:armazenamento_de_dados/app/splash_page.dart';
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
            onPressed: () {
              final secure = FlutterSecureStorage(
                aOptions: AndroidOptions.biometric(
                  enforceBiometrics: true, // Requires biometric/PIN/pattern
                  biometricPromptTitle: 'Mostra o dedo rapa!',
                ),
              );
              secure.deleteAll().then((value) {
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashPage()),
                  );
                }
              });
            },
            child: Text('SAIR'),
          ),
        ],
      ),
    );
  }
}
