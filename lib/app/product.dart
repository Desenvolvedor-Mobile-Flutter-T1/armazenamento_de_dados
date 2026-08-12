class ProductModel {
  final int id;
  final String name;
  final double price;
  ProductModel({required this.id, required this.name, required this.price});

  @override
  String toString() => 'ProductModel(id: $id, name: $name, price: $price)';
}
