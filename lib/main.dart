import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ClassroomApp());
}

class ClassroomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài Tập - Minh Phước',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
          primary: Colors.green,
          secondary: Colors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: false,
        ),
      ),
      home: HomeScreen(),
    );
  }
}