import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/view/home_screen.dart';
import 'package:users_app/controller/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
        home: const HomeScreen(),
      ),
    );
  }
}
