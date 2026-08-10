import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 60,
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: .all(Colors.lightGreen)),
              onPressed: () {},
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
