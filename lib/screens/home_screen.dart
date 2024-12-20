import 'package:flutter/material.dart';
import 'package:skin_match/screens/search_screen.dart';  
import 'package:carousel_slider/carousel_slider.dart';  // Import CarouselSlider

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.pink),
                      SizedBox(width: 10),
                      Text(
                        'Search products...',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // CarouselSlider dengan perbaikan ukuran gambar
              CarouselSlider(
                options: CarouselOptions(
                  height: 380,  // Tingkatkan tinggi gambar
                  autoPlay: true,  // Mengaktifkan autoplay
                  enlargeCenterPage: true,  // Memperbesar gambar di tengah
                  aspectRatio: 1.5,  // Menyesuaikan rasio gambar
                  viewportFraction: 1.0,  // Menampilkan gambar secara penuh
                ),
                items: [
                  _buildCarouselItem('images/skintific.jpg'),
                  _buildCarouselItem('images/ser.jpg'),
                  _buildCarouselItem('images/set.jpg'),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'Trending Product',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontFamily: 'DeliciousHandrawn',
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(2, (index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink[50],
                            ),
                            child: Icon(Icons.image, size: 40, color: Colors.pink),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DeliciousHandrawn',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'This is the description of product ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'DeliciousHandrawn',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Icon(Icons.star, size: 14, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'DeliciousHandrawn',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun item carousel
  Widget _buildCarouselItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pink[100],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,  // Menggunakan BoxFit.cover untuk menjaga rasio aspek gambar
          width: double.infinity,
          height: 250,  // Menyesuaikan tinggi gambar
        ),
      ),
    );
  }
}
