import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhaji/models/users.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(id: user.uid);
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebase);
  }

  Future<User> getCurrentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  Future<User> signInEmailPassword({String email, String password}) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  Future<void> resetPassword({String email}) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
