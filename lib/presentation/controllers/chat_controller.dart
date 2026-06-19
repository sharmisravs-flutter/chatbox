import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/repos/chat_repo.dart';

class ChatController {
  ChatRepo _chatRepo;

  ChatController(this._chatRepo);

  Stream<List<Message>> getMessages(String uid) {
    return _chatRepo.getMessages(uid);
  }

  Future<void> sendMessage({
    required UserData user,
    required Message msg,
    required UserData currentUser,
  }) async {
    await _chatRepo.sendMsg(user: user, currentUser: currentUser, msg: msg);
  }
}
