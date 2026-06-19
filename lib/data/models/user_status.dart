// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserStatus {
  String name;
  String profileImage;
  String status;
  String id;
  List<String>? messages;
  String? postedAt;

  UserStatus({
    required this.name,
    required this.profileImage,
    required this.status,
    required this.id,
    this.messages,
    this.postedAt
  });

  UserStatus copyWith({
    String? name,
    String? profileImage,
    String? status,
    String? id,
    List<String>? messages,
    String? postedAt,
  }) {
    return UserStatus(
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      status: status ?? this.status,
      id: id ?? this.id,
      messages: messages ?? this.messages,
      postedAt: postedAt ?? this.postedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profileImage': profileImage,
      'status': status,
      'id': id,
      'messages': messages,
      'postedAt': postedAt,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserStatus(name: $name, profileImage: $profileImage, status: $status, id: $id, messages: $messages, postedAt: $postedAt)';
  }

  @override
  bool operator ==(covariant UserStatus other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profileImage == profileImage &&
      other.status == status &&
      other.id == id &&
      listEquals(other.messages, messages) &&
      other.postedAt == postedAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profileImage.hashCode ^
      status.hashCode ^
      id.hashCode ^
      messages.hashCode ^
      postedAt.hashCode;
  }
}
