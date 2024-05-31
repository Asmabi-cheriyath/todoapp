import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/models/user_model.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _userCollection=FirebaseFirestore.instance.collection("users");


  Future<UserCredential?>registerUser(UserModel user)async{

     UserCredential userData = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: user.email.toString(),
                            password: user.password.toString());

                            if (userData != null) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(userData.user!.uid)
                          .set({
                        'uid': userData.user!.uid,
                        'email': userData.user!.email,
                        'name': user.name,
                        'createdAt': user.createdAt,
                        'status': user.status,
                      });

                      return userData;

  }
}}