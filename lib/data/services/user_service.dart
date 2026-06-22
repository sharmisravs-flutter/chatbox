import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/models/user_messages_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<UserData>> getUsers() async {
    CollectionReference _ref = _firestore.collection("users");
    QuerySnapshot snapshot = await _ref.get();
    final List<UserData> users = snapshot.docs
        .map((doc) => UserData.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return users;
  }

  Future<List<Message>> getMessages(String currentUID, String uid) async {
    final chatId = [currentUID, uid]..sort();
    final ref = _firestore
        .collection('chats')
        .doc('${chatId[0]}_${chatId[1]}')
        .collection('messages');
    QuerySnapshot snapshot = await ref.get();
    final List<Message> messages = snapshot.docs
        .map((doc) => Message.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return messages;
  }

  Stream<List<UserMsgsInfo>> getUserMsgInfo() {
    final currentUID = _auth.currentUser?.uid;
    return _firestore
        .collection('chats')
        .where('uids', arrayContains: currentUID)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserMsgsInfo.fromMap(doc.data()))
              .toList(),
        );
  }

  Future<UserData> getUserDetailsByUid(String uid) async {
    final doc = await _firestore.collection("users").doc(uid).get();
    final UserData user = UserData.fromMap(doc.data() as Map<String, dynamic>);
    return user;
  }

  String currentUserUid() {
    final currentUID = _auth.currentUser?.uid;
    return currentUID!;
  }
}
