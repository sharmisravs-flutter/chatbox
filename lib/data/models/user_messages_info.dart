import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chatbox/data/models/user_data.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMsgsInfo {
  String lastMessage;
  String lastMessageTime;
  List<String> uids;
  List<UserData> userData;
  UserMsgsInfo({
    required this.lastMessage,
    required this.lastMessageTime,
    required this.uids,
    required this.userData,
  });

  UserMsgsInfo copyWith({
    String? lastMessage,
    String? lastMessageTime,
    List<String>? uids,
    List<UserData>? userData,
  }) {
    return UserMsgsInfo(
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      uids: uids ?? this.uids,
      userData: userData ?? this.userData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'uids': uids,
      'userData': userData.map((x) => x.toMap()).toList(),
    };
  }

  factory UserMsgsInfo.fromMap(Map<String, dynamic> map) {
    return UserMsgsInfo(
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: map['lastMessageTime'] ?? '',
      uids: List<String>.from(map['uids'] ?? []),
      userData: (map['userData'] as List<dynamic>? ?? [])
          .map((e) => UserData.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMsgsInfo.fromJson(String source) =>
      UserMsgsInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserMsgsInfo(lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, uids: $uids, userData: $userData)';
  }

  @override
  bool operator ==(covariant UserMsgsInfo other) {
    if (identical(this, other)) return true;

    return other.lastMessage == lastMessage &&
        other.lastMessageTime == lastMessageTime &&
        listEquals(other.uids, uids) &&
        listEquals(other.userData, userData);
  }

  @override
  int get hashCode {
    return lastMessage.hashCode ^
        lastMessageTime.hashCode ^
        uids.hashCode ^
        userData.hashCode;
  }
}
