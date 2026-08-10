import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('SALVAR')),
          ElevatedButton(onPressed: () {}, child: Text('RECUPERAR')),
        ],
      ),
    );
  }
}
