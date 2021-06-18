import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dscore_app/domain/current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static CurrentUser? currentUser;

  Future<void> signUpWithEmailAndPassWord(String email, String password) async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await _db.collection('users').doc(user.uid).set(<String, dynamic>{
          'email': user.email,
          'id': user.uid,
        });
      }
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      throw error;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
      }
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      throw error;
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      print(error);
      throw error;
    }
  }

  Future<bool> getIsExistUser(User user) async {
    final query =
        await _db.collection('users').where('id', isEqualTo: user.uid).get();
    if (query.docs.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> getCurrentUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final query = await _db
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (query.size == 1) {
          currentUser = query.docs.map((doc) => CurrentUser(doc)).toList()[0];
        }
      } else {
        print('ログインしていない。');
        return;
      }
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      throw error;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    currentUser = null;
  }

  Future<bool> reAuthenticate(String password) async {
    try {
      final user = _auth.currentUser;
      final credential =
          EmailAuthProvider.credential(email: user!.email!, password: password);
      await user.reauthenticateWithCredential(credential);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updateEmail(String newEmail) async {
    try {
      final user = _auth.currentUser!;
      await user.updateEmail(newEmail);
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      print(error);
      throw error;
    }
  }

  Future<void> updateEmailInDB() async {
    try {
      final user = _auth.currentUser!;
      await _db.collection('user').doc('${user.uid}').update(<String, dynamic>{
        'email': user.email,
      });
    } on Exception catch (e) {
      final Error error = ArgumentError(e);
      print(error);
      throw error;
    }
  }
}
