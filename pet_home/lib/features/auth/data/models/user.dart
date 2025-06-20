import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({required this.id, this.name, this.surname, this.email});

  final String id;
  final String? name;
  final String? surname;
  final String? email;

  static const empty = UserModel(id: '');
  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, name, surname, email];
}
