import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/models/user_model.dart';
import 'package:todoapp/services/auth_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  UserModel _userModel = UserModel();
  AuthService _authService = AuthService();

  final _registerkey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    _userModel = UserModel(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      status: 1,
      createdAt: DateTime.now(),
    );

    try {
      await Future.delayed(Duration(
        seconds: 2,
      ));

      final userdata = await _authService.registerUser(_userModel);

      if (userdata != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });

      List err = e.toString().split("]");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err[1])));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Form(
              key: _registerkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create an Account",
                    style: themedata.textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: themedata.textTheme.displaySmall,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter an Name";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      hintText: "Enter your Name",
                      hintStyle: themedata.textTheme.displaySmall,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: themedata.textTheme.displaySmall,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter an Email Id";
                      }
                      return null;
                    },
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: themedata.textTheme.displaySmall,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: themedata.textTheme.displaySmall,
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the Password";
                      }
                    },
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: themedata.textTheme.displaySmall,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_registerkey.currentState!.validate()) {

                        _register();

                        
                        // UserCredential userData = await FirebaseAuth.instance
                        //     .createUserWithEmailAndPassword(
                        //         email: _emailController.text.trim(),
                        //         password: _passwordController.text.trim());
                        // if (userData != null) {
                        //   FirebaseFirestore.instance
                        //       .collection('users')
                        //       .doc(userData.user!.uid)
                        //       .set({
                        //     'uid': userData.user!.uid,
                        //     'email': userData.user!.email,
                        //     'name': _nameController.text,
                        //     'createdAt': DateTime.now(),
                        //     'status': 1,
                        //   }).then((value) => Navigator.pushNamedAndRemoveUntil(
                        //           context, '/home', (route) => false));
                        // }

                        // final userdata =
                        //     await _authService.registerUser(_userModel);

                        // if (userdata != null) {
                        //   Navigator.pushNamedAndRemoveUntil(
                        //       context, '/home', (route) => false);
                        // }
                      }
                    },
                    child: Container(
                      height: 48,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Register",
                          style: themedata.textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: themedata.textTheme.displaySmall,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: themedata.textTheme.displayMedium,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Visibility(
                visible: _isLoading,
                child: Center(
                  child: CircularProgressIndicator(),
                ))
          ],
        ),
      ),
    );
  }
}
