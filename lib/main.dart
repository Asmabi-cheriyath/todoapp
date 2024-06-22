import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/screens/add_task_page.dart';
import 'package:todoapp/screens/login_page.dart';
import 'package:todoapp/screens/register_page.dart';
import 'package:todoapp/screens/splash_page.dart';
import 'package:todoapp/screens/todo_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: "/splash",
      routes: {
        '/': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/home': (context) => const TodoHomePage(),
        '/addtask': (context) => const AddTaskView(),
        '/splash': (context) => const SplashView()
      },
      theme: ThemeData(
          textTheme: const TextTheme(
            displayMedium: TextStyle(color: Colors.white, fontSize: 18),
            displaySmall: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          scaffoldBackgroundColor: const Color(0xff0E1D3E),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff0E1D3E),
              iconTheme: IconThemeData(color: Colors.white)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
    );
  }
}
