import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/services/chat_service.dart';

class ChatRepo {
  ChatService _chatService;

  ChatRepo(this._chatService);

  Stream<List<Message>> getMessages(String uid) {
    return _chatService.getAllMessages(uid);
  }

  Future<void> sendMsg({
    required UserData user,
    required Message msg,
    required UserData currentUser,
  }) async {
    await _chatService.sendMsg(user: user, msg: msg, currentUser: currentUser);
  }
}
