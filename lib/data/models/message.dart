// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  String msg;
  String dateTime;
  String? id;
  String? messageFrom;
  String? messageStatus;

  Message({
    required this.msg,
    required this.dateTime,
    this.id,
    this.messageFrom,
    this.messageStatus,
  });

  Message copyWith({
    String? msg,
    String? dateTime,
    String? id,
    String? messageFrom,
    String? messageStatus,
  }) {
    return Message(
      msg: msg ?? this.msg,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
      messageFrom: messageFrom ?? this.messageFrom,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msg': msg,
      'dateTime': dateTime,
      'id': id,
      'messageFrom': messageFrom,
      'messageStatus': messageStatus,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      msg: map['msg'] as String,
      dateTime: map['dateTime'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      messageFrom: map['messageFrom'] != null
          ? map['messageFrom'] as String
          : null,
      messageStatus: map['messageStatus'] != null
          ? map['messageStatus'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(msg: $msg, dateTime: $dateTime, id: $id, messageFrom: $messageFrom, messageStatus: $messageStatus)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.msg == msg &&
        other.dateTime == dateTime &&
        other.id == id &&
        other.messageFrom == messageFrom &&
        other.messageStatus == messageStatus;
  }

  @override
  int get hashCode {
    return msg.hashCode ^
        dateTime.hashCode ^
        id.hashCode ^
        messageFrom.hashCode ^
        messageStatus.hashCode;
  }
}

enum MessageStatus {
  sending("sending"),
  sent("sent"),
  delivered("delivered"),
  seen("seen");

  final String label;

  const MessageStatus(this.label);
}
