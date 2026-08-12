import 'package:armazenamento_de_dados/app/product_model.dart';
import 'package:armazenamento_de_dados/app/user_model.dart';
import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<ProductModel>(), AdapterSpec<UserModel>()])
part 'hive_adapters.g.dart';
