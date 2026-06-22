import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/models/user_messages_info.dart';
import 'package:chatbox/data/repos/user_repo.dart';

class UserController {
  final UserRepo _userRepo;

  UserController(this._userRepo);

  Future<List<UserData>> getUsers() async {
    try {
      return await _userRepo.getUsers();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<UserMsgsInfo>> getUserMsgInfo() {
    return _userRepo.getUserMsgInfo();
  }

  String currentUserUid() {
    return _userRepo.currentUserUid();
  }

  Future<UserData> getUserDetailsByUid(String uid) async {
    return await _userRepo.getUserDetailsByUid(uid);
  }
}
