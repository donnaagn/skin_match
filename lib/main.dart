import 'package:flutter/material.dart';
import 'package:skin_match/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_match/screens/main_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(SkinMatchApp(
    isLoggedIn: isLoggedIn,
  ));

}

class SkinMatchApp extends StatelessWidget {
  final bool isLoggedIn;
  const SkinMatchApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'SkinMatch',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Warna tema aplikasi
        fontFamily: 'DeliciousHandrawn', // Font default
      ),
      home: isLoggedIn ? const MainScreen() : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen()
      },
    );
  }
}
