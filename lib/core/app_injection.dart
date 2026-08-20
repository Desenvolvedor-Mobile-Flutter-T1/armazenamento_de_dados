import 'package:armazenamento_de_dados/app/citacoes/datasources/local/citacao_local_datasource.dart';
import 'package:armazenamento_de_dados/app/citacoes/datasources/remote/citacao_remote_datasource.dart';
import 'package:armazenamento_de_dados/app/citacoes/repositories/local/citacao_local_repository.dart';
import 'package:armazenamento_de_dados/app/citacoes/repositories/remote/citacao_remote_repository.dart';
import 'package:armazenamento_de_dados/app/citacoes/view/cadastro/bloc/cadastro_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final injection = GetIt.instance;

void initInjection({required Database database, required Dio dio}) {
  injection.registerLazySingleton<Database>(() => database);
  injection.registerLazySingleton<Dio>(() => dio);

  //Citacoes
  ///Local
  injection.registerFactory<CitacaoLocalDatasource>(
    () => CitacaoLocalDatasourceImpl(database: injection<Database>()),
  );
  injection.registerFactory<CitacaoLocalRepository>(
    () => CitacaoLocalRepositoryImpl(
      localDatasource: injection<CitacaoLocalDatasource>(),
    ),
  );

  ///Remote
  injection.registerFactory<CitacaoRemoteDatasource>(
    () => CitacaoRemoteDatasourceImpl(dio: injection<Dio>()),
  );
  injection.registerFactory<CitacaoRemoteRepository>(
    () => CitacaoRemoteRepositoryImpl(
      remoteDatasource: injection<CitacaoRemoteDatasource>(),
    ),
  );

  //Blocs
  ////Registrar Citacoes
  injection.registerFactory<CadastroBloc>(
    () => CadastroBloc(
      localRepository: injection<CitacaoLocalRepository>(),
      remoteRepository: injection<CitacaoRemoteRepository>(),
    ),
  );
}
