import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _userCollection=FirebaseFirestore.instance.collection("users");


  // Future<void>registerUser(UserModel user)async{

  // }
}