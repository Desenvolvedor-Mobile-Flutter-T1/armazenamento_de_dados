import 'package:armazenamento_de_dados/app/product_model.dart';
import 'package:armazenamento_de_dados/app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive_ce.dart';

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
              final box = await Hive.openBox('product');
              final prod = ProductModel(id: 35, name: 'SAl', price: 5);
              box.put(prod.id, prod);
            },
            child: Text('CRIAR'),
          ), //create
          ElevatedButton(
            onPressed: () {
              final box = Hive.box('product');
              final prod = box.get(35);
              print(prod);
            },
            child: Text('LER'),
          ), //read
          ElevatedButton(
            onPressed: () {
              final box = Hive.box('product');
              box.put(
                35,
                ProductModel(
                  id: 35,
                  name: 'SABÃO',
                  price: 10,
                  userModel: UserModel(id: 10, name: 'Rafael'),
                ),
              );
            },
            child: Text('ATUALIZAR'),
          ), //update
          ElevatedButton(
            onPressed: () {
              final box = Hive.box('product');
              box.delete(35);
            },
            child: Text('DELETAR'),
          ), //delete
        ],
      ),
    );
  }
}
