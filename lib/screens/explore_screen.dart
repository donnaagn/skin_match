import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: CategoryScreen(), // Halaman utama aplikasi
    );
  }
}

// Halaman utama aplikasi
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                crossAxisSpacing: 12.0, // Jarak horizontal antar item
                mainAxisSpacing: 12.0, // Jarak vertikal antar item
                children: [
                  _buildCategoryItem(context, Icons.water_drop, 'Moisturizer', MoisturizerScreen()),
                  _buildCategoryItem(context, Icons.cleaning_services, 'Toner', TonerScreen()),
                  _buildCategoryItem(context, Icons.science, 'Serum', SerumScreen()),
                  _buildCategoryItem(context, Icons.wb_sunny, 'Sunscreen', SunscreenScreen()),
                  _buildCategoryItem(context, Icons.face, 'Face Mask', FaceMaskScreen()),
                  _buildCategoryItem(context, Icons.face_3, 'Lips Care', LipsCareScreen()),
                  _buildCategoryItem(context, Icons.soap, 'Cleanser', CleanserScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun item kategori dengan navigasi
  Widget _buildCategoryItem(BuildContext context, IconData icon, String label, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
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
      ),
    );
  }
}

// Screen dengan desain grid untuk menampilkan daftar produk
class CategoryDetailScreen extends StatelessWidget {
  final String title;

  const CategoryDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SkinMatch',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'FleurDeLeah',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kotak persegi panjang berisi nama kategori
            Container(
              alignment: Alignment.center,
              width: double.infinity, // Lebar penuh
              padding: EdgeInsets.symmetric(vertical: 12.0), // Padding vertikal
              margin: EdgeInsets.only(bottom: 16.0), // Jarak ke GridView
              decoration: BoxDecoration(
                color: Colors.pink.shade50, // Warna latar belakang
                borderRadius: BorderRadius.circular(12.0), // Radius sudut
                border: Border.all(color: Colors.pink.shade200, width: 1), // Border
              ),
              child: Text(
                title, // Teks sesuai nama kategori
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            // GridView untuk daftar produk
            Expanded(
              child: GridView.builder(
                itemCount: 9, // Jumlah produk contoh
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailScreen()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink.shade100, width: 2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 50, color: Colors.pink.shade200),
                          SizedBox(height: 8),
                          Text(
                            'Nama Produk',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '4.2 ★ 123 Reviews',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'SkinMatch',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'FleurDeLeah',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Detail produk di sini',
          style: TextStyle(
            fontSize: 18,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

// Update untuk navigasi ke detail kategori
class MoisturizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Moisturizer');
  }
}

class TonerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Toner');
  }
}

class SerumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Serum');
  }
}

class SunscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Sunscreen');
  }
}

class FaceMaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Face Mask');
  }
}

class LipsCareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Lips Care');
  }
}

class CleanserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryDetailScreen(title: 'Cleanser');
  }
}
