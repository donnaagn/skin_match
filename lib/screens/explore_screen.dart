import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: categoryscreen(), // Halaman utama aplikasi
    );
  }
}

// Halaman utama aplikasi
class categoryscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink), // Tombol kembali dengan ikon panah
          onPressed: () {}, // Fungsi tombol kembali (belum diimplementasikan)
        ),
        title: const Text(
          'SkinMatch',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'FleurDeLeah',
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white, // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
        centerTitle: true, // Menempatkan judul di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk konten
        child: Column(
          children: [
            Container(
              alignment: Alignment.center, // Menempatkan teks di tengah
              height: 50, // Tinggi kotak
              decoration: BoxDecoration(
                color: Colors.pink.shade50, // Warna latar belakang kotak
                borderRadius: BorderRadius.circular(12.0), // Radius sudut kotak
              ),
              child: Text(
                'Category', // Teks di dalam kotak
                style: TextStyle(
                  color: Colors.pink, // Warna teks
                  fontSize: 16, // Ukuran font
                  fontWeight: FontWeight.bold, // Teks tebal
                ),
              ),
            ),
            SizedBox(height: 20), // Spasi antara kotak kategori dan GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Jumlah kolom dalam grid
                crossAxisSpacing: 16.0, // Jarak horizontal antar item
                mainAxisSpacing: 16.0, // Jarak vertikal antar item
                children: [
                  _buildCategoryItem(Icons.water_drop, 'Moisturizer'), // Item kategori
                  _buildCategoryItem(Icons.cleaning_services, 'Toner'),
                  _buildCategoryItem(Icons.science, 'Serum'),
                  _buildCategoryItem(Icons.wb_sunny, 'Sunscreen'),
                  _buildCategoryItem(Icons.face, 'Face Mask'),
                  _buildCategoryItem(Icons.face_3, 'Lips Care'),
                  _buildCategoryItem(Icons.soap, 'Cleanser'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun item kategori
  Widget _buildCategoryItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade50, // Warna latar belakang item
        borderRadius: BorderRadius.circular(12.0), // Radius sudut item
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten secara vertikal
        children: [
          Icon(icon, color: Colors.pink, size: 40), // Ikon kategori
          SizedBox(height: 8), // Spasi antara ikon dan label
          Text(
            label, // Label kategori
            style: TextStyle(
              color: Colors.pink, // Warna teks label
              fontWeight: FontWeight.bold, // Teks tebal
            ),
          ),
        ],
      ),
    );
  }
}