import 'package:armazenamento_de_dados/app/citacoes/view/cadastro/bloc/cadastro_bloc.dart';
import 'package:armazenamento_de_dados/core/app_injection.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final bloc = injection.get<CadastroBloc>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
