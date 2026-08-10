import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: 50,
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('SALVAR')),
          ElevatedButton(onPressed: () {}, child: Text('RECUPERAR')),
        ],
      ),
    );
  }
}
