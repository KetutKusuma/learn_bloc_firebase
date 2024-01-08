import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String? id, name, email;

  const MyUserEntity({
    this.id,
    this.name,
    this.email,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
