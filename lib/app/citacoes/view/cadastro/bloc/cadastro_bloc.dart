// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:armazenamento_de_dados/app/citacoes/repositories/remote/citacao_remote_repository.dart';
import 'package:armazenamento_de_dados/app/shared/interfaces/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:armazenamento_de_dados/app/citacoes/repositories/local/citacao_local_repository.dart';

part 'cadastro_event.dart';

class CadastroBloc extends Bloc<CadastroEvent, AppState> {
  final CitacaoLocalRepository _localRepository;
  final CitacaoRemoteRepository _remoteRepository;

  CadastroBloc({
    required this._localRepository,
    required this._remoteRepository,
  }) : super(AppInitialState()) {
    on<CadastroEvent>((event, emit) {});
  }
}
