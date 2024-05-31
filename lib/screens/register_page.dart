import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final _registerkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
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
                    UserCredential userData = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                    if (userData != null) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(userData.user!.uid)
                          .set({
                        'uid': userData.user!.uid,
                        'email': userData.user!.email,
                        'name': _nameController.text,
                        'createdAt': DateTime.now(),
                        'status': 1,
                      }).then((value) => Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false));
                    }
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
      ),
    );
  }
}
