import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseService(this._auth, this._firestore);

  // -------- Authentication -----------------------------
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'signin-error',
        message: 'Failed to sign in: ${e.toString()}',
      );
    }
  }

  Future<UserCredential> register(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'registration-error',
        message: 'Failed to register: ${e.toString()}',
      );
    }
  }

  // -------- Chat -----------------------------
  Future<void> sendMessage(String text, String userEmail) async {
    try {
      await _firestore.collection(kMessagesCollection).add({
        kMessageData: text.trim(),
        kMessageTime: FieldValue.serverTimestamp(), // time message created at
        kMessageId: userEmail.trim(),
      });
    } catch (e) {
      throw Exception('Failed to send message: ${e.toString()}');
    }
  }

  Stream<List<MessageModel>> messagesStream() {
    return _firestore
        .collection(kMessagesCollection)
        .orderBy(kMessageTime, descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromJson(doc))
            .toList());
  }

  // Add user state management
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  
  Future<void> signOut() async {
    await _auth.signOut();
  }
}