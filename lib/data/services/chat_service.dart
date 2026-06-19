import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/models/user_messages_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getAllMessages(String userID) {
    String? currentUID = _auth.currentUser?.uid;
    final chatId = [currentUID, userID]..sort();
    return _firestore
        .collection("chats")
        .doc('${chatId[0]}_${chatId[1]}')
        .collection("messages")
        .orderBy("dateTime")
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList(),
        );
  }

  Future<void> sendMsg({
    required UserData user,
    required Message msg,
    required UserData currentUser,
  }) async {
    final chatId = [currentUser.uid, user.uid]..sort();
    final ref = _firestore
        .collection('chats')
        .doc('${chatId[0]}_${chatId[1]}')
        .collection('messages');
    msg.id = ref.doc().id;
    final snapshot = await ref.get();

    UserMsgsInfo userMsgsInfo = UserMsgsInfo(
      lastMessage: msg.msg,
      lastMessageTime: msg.dateTime,
      uids: [user.uid!, currentUser.uid!],
      userData: [user, currentUser],
    );

    await _firestore
        .collection('chats')
        .doc('${chatId[0]}_${chatId[1]}')
        .set(userMsgsInfo.toMap());

    await ref.doc().set({
      "msg": msg.msg,
      "dateTime": msg.dateTime,
      "messageFrom": msg.messageFrom,
      "messageStatus": msg.messageStatus,
    });
  }
}
