// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserData {
  String name;
  String email;
  String? id;

  UserData({required this.name, required this.email, this.id});

  UserData copyWith({String? name, String? email, String? id}) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'id': id};
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}
