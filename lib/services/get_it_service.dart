import 'package:chat_app/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;


void setupGetIt() {
  getIt.registerSingleton<FirebaseAuth>(auth);
  getIt.registerSingleton<FirebaseFirestore>(firestore);
  getIt.registerSingleton<FirebaseService>(FirebaseService(auth, firestore));
}
