// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserData {
  String name;
  String email;
  String? uid;

  UserData({required this.name, required this.email, this.uid});

  UserData copyWith({String? name, String? email, String? uid}) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'uid': uid};
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      email: map['email'] as String,
      uid: map['uid'] != null ? map['uid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}
