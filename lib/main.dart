import 'package:flutter/material.dart';
import 'package:skin_match/screens/main_screen.dart'; // Pastikan path-nya sesuai dengan struktur proyek Anda.

void main() {
  runApp(const SkinMatchApp());
}

class SkinMatchApp extends StatelessWidget {
  const SkinMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'SkinMatch',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Warna tema aplikasi
        fontFamily: 'DeliciousHandrawn', // Font default
      ),
      home: const MainScreen(), // Halaman utama
    );
  }
}
