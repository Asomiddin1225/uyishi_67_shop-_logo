import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final authService = FirebaseAuth.instance;

  Future<void> login(String email, password) async {
    try {
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await authService.signOut();
  }
}