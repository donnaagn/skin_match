import 'package:flutter/material.dart';
import 'package:skin_match/screens/detail_screen.dart';
import '../models/product.dart';
import '../data/product_data.dart';






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
                crossAxisSpacing: 16.0, // Jarak horizontal antar item
                mainAxisSpacing: 16.0, // Jarak vertikal antar item
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
// Halaman utama aplikasi
// Halaman utama aplikasi
class CategoryDetailScreen extends StatelessWidget {
  final String title;

  const CategoryDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = productsByCategory[title] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.pink,
            fontFamily: 'FleurDeLeah',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen( product:product),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade100, width: 2),
                  //borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
<<<<<<< Updated upstream
                        borderRadius: BorderRadius.circular(16), // Opsional, untuk memberi border radius pada gambar
                        child: Image.network(
                          product.image,  // Menampilkan gambar dari URL
                          width: 200,  // Atur ukuran sesuai kebutuhan
                          height: 200,
                          fit: BoxFit.cover, // Agar gambar mengisi area dengan proporsional
                        ),
                  

                ),
=======
                      //borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        product.image,
                        width: 200, // Ukuran diperbesar
                        height: 200, // Ukuran diperbesar
                        fit: BoxFit.cover,
                      ),
                    ),
>>>>>>> Stashed changes
                    SizedBox(height: 8),
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${product.rating} ★ ${product.reviews} Reviews',
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
    );
  }
}



// class ProductDetailScreen extends StatelessWidget {
//   final String productName;

//   const ProductDetailScreen({super.key, required this.productName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.pink),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Product Details',
//           style: TextStyle(
//             color: Colors.pink,
//             fontFamily: 'FleurDeLeah',
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'Detail produk: $productName',
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.pink,
//           ),
//         ),
//       ),
//     );
//   }
// }


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
