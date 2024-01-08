import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('user');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  // TODO: implement user
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    // TODO: implement signIn
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log('Error catch sign in : $e');
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    // TODO: implement signUp
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email!,
        password: password,
      );
      myUser.copyWith(
        id: userCredential.user!.uid,
        // email: userCredential.user!.email,
        // name: userCredential.user!.displayName,
      );

      return myUser;
    } catch (e) {
      log('Error catch sign up : $e');
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    // TODO: implement setUserData
    try {
      await userCollection.doc(myUser.id).set(
            myUser.toEntity().toDocument(),
          );
    } catch (e) {
      log('Erorr catch set user data : $e');
      rethrow;
    }
  }
}
