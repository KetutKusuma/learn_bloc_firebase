import 'package:equatable/equatable.dart';

import '../entities/user_entity.dart';

class MyUser extends Equatable {
  final String? id, email, name;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
  });

  MyUser copyWith({String? id, email, name}) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
    );
  }

  static MyUser fromEntity(MyUserEntity myUserEntity) {
    return MyUser(
      id: myUserEntity.id,
      email: myUserEntity.email,
      name: myUserEntity.email,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name];
}
