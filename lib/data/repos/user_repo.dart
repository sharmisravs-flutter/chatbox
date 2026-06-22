import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/models/user_messages_info.dart';
import 'package:chatbox/data/services/user_service.dart';

class UserRepo {
  final UserService _userService;

  UserRepo(this._userService);

  Future<List<UserData>> getUsers() async {
    return await _userService.getUsers();
  }

  Stream<List<UserMsgsInfo>> getUserMsgInfo() {
    return _userService.getUserMsgInfo();
  }

  String currentUserUid() {
    return _userService.currentUserUid();
  }

  Future<UserData> getUserDetailsByUid(String uid) async {
    return await _userService.getUserDetailsByUid(uid);
  }
}
