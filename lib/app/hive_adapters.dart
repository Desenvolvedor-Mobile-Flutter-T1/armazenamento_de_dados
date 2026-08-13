import 'package:armazenamento_de_dados/app/citacao_model.dart';

import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<CitacaoModel>()])
part 'hive_adapters.g.dart';
