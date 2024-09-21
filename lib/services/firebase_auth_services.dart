import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign up with email, password, and username
  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      print("checkpoint");
      print(user);
      // Store additional information like username in Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
        });
      }

      return user;
    } catch (e, stacktrace) {
      // Print the error and the stack trace
      print('An error occurred: $e');
      print('Stack trace: $stacktrace');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Check if user is signed in
  bool isSignedIn() {
    return getCurrentUser() != null;
  }

  Future<void> storeUserDetails(String userId, String username) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'username': username,
    });
  }
}
