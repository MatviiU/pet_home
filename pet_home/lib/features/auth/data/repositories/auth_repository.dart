import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_home/features/auth/data/models/user.dart';

class AuthRepository {
  AuthRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? fireStore})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _fireStore = fireStore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return UserModel.empty;
      } else {
        final userData =
            await _fireStore.collection('users').doc(firebaseUser.uid).get();
        if (userData.exists) {
          final data = userData.data()!;
          return UserModel(
            id: firebaseUser.uid,
            name: data['name'],
            surname: data['surname'],
            email: firebaseUser.email,
          );
        } else {
          return UserModel(id: firebaseUser.uid, email: firebaseUser.email);
        }
      }
    });
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      rethrow;
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'surname': surname,
        'email': email,
        'createdAt': Timestamp.now(),
      });
    } on FirebaseAuthException catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
