import 'package:chatbox/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final AuthServices _authServices;

  AuthRepo(this._authServices);

  Future<String> login({required String email, required String password}) {
    return _authServices.loginUser(email: email, password: password);
  }

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    return _authServices.signUpUser(
      email: email,
      password: password,
      name: name,
    );
  }

  User? getCurrentUser() {
    return _authServices.getCurrentUser();
  }

  Future<void> logout() {
    return _authServices.signOut();
  }
}
