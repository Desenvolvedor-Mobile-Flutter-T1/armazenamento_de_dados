// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int id;
  final String name;
  UserModel({required this.id, required this.name});

  @override
  String toString() => 'UserModel(id: $id, name: $name)';
}
