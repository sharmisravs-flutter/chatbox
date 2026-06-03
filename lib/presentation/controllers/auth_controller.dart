import 'package:chatbox/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final AuthRepo _authRepo;

  AuthController(this._authRepo);

  Future<String> login({required String email, required String password}) {
    return _authRepo.login(email: email, password: password);
  }

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return _authRepo.signUp(email: email, password: password, name: name);
  }

  User? getCurrentUser() {
    return _authRepo.getCurrentUser();
  }

  Future<void> logout() {
    return _authRepo.logout();
  }
}
