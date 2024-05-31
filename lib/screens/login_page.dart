import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login to Your Account",
                style: themedata.textTheme.displayMedium,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: themedata.textTheme.displaySmall,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter an Email Id";
                  }
                },
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: themedata.textTheme.displaySmall,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(height: 10,),
              Container(
                height: 48,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Login",style: themedata.textTheme.displayMedium,),),
              ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Don't have an Account?",style: themedata.textTheme.displaySmall,),
              SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Create Now",style: themedata.textTheme.displayMedium,))],)
            ],
          ),
        ),
      ),
    );
  }
}
