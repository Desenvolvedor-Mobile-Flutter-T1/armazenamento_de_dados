import 'package:armazenamento_de_dados/app/user_model.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final UserModel? userModel;
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.userModel,
  });

  @override
  String toString() =>
      'ProductModel(id: $id, name: $name, price: $price, user: $userModel)';
}
