import 'package:armazenamento_de_dados/app/home_data.dart';
import 'package:armazenamento_de_dados/app/quote_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeData data = HomeData();
  final updateController = TextEditingController();
  QuoteModel? selectedQuote;

  @override
  void initState() {
    data.scriptzaoDoPoder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: Column(
        spacing: 50,
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          TextField(
            controller: updateController,
            maxLines: null,
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () {
                  if (updateController.text.isNotEmpty ||
                      updateController.text != selectedQuote?.quote ||
                      selectedQuote != null) {
                    data.updateDataAndRefresh(
                      quote: selectedQuote!.copyWith(
                        quote: updateController.text,
                      ),
                    );
                  }
                },
                icon: Icon(Icons.save),
              ),
            ),
          ),
          ListenableBuilder(
            listenable: data,
            builder: (context, child) {
              if (data.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: data.quotes.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: selectedQuote?.id == data.quotes[index].id
                          ? Colors.amber
                          : Colors.white,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            if (selectedQuote?.id == data.quotes[index].id) {
                              selectedQuote = null;
                              updateController.text = '';
                              return;
                            }
                            selectedQuote = data.quotes[index];
                            updateController.text = data.quotes[index].quote;
                          });
                        },

                        leading: Text(data.quotes[index].id.toString()),
                        title: Text(data.quotes[index].quote),
                        subtitle: Text(data.quotes[index].author),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
