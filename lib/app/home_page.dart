import 'package:armazenamento_de_dados/app/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final viewModel = HomeViewmodel();
  @override
  void initState() {
    viewModel.buscarCitacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Citações',
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchController,
              keyboardType: .number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      viewModel.filtrarPorId(
                        id: int.parse(searchController.text),
                      );
                    }
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              if (viewModel.loading) {
                return Center(child: CircularProgressIndicator());
              }
              if (viewModel.citacoes.isEmpty) {
                return Center(
                  child: Text(
                    'Nenhuma citação encontrada, busque através do botão',
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: viewModel.citacoes.length,
                  itemBuilder: (context, index) {
                    final citacao = viewModel.citacoes[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? const Color.fromARGB(255, 206, 229, 218)
                            : Colors.greenAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                      child: ListTile(
                        leading: Text(citacao.id.toString()),
                        title: Text(
                          citacao.texto,
                          style: TextStyle(fontStyle: .italic),
                        ),
                        subtitle: Text(citacao.autor),
                      ),
                    );
                  },
                ),
              );
            },
          ), //create
        ],
      ),
    );
  }
}
