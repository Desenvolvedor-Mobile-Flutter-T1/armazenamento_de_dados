import 'package:armazenamento_de_dados/app/home/view/home_view.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const home = '/';

  static final routes = <String, Widget Function(BuildContext)>{
    home: (context) => HomeView(),
  };
}
