import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Daftar untuk menyimpan riwayat pencarian produk
  List<String> searchHistory = [];

  // Controller untuk TextField
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Membersihkan controller ketika widget dihapus
    _searchController.dispose();
    super.dispose();
  }

  // Fungsi untuk menambahkan pencarian ke riwayat
  void _addToSearchHistory(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      setState(() {
        searchHistory.add(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.pink,
            fontFamily: 'FleurDeLeah',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          // Tombol pencarian untuk kembali ke HomeScreen
          IconButton(
            icon: const Icon(Icons.close, color: Colors.pink),
            onPressed: () {
              // Menutup layar pencarian dan kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kolom pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.pink[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (query) {
                // Menambahkan hasil pencarian ke riwayat setelah pencarian selesai
                _addToSearchHistory(query);
                _searchController.clear(); // Membersihkan input setelah pencarian
              },
            ),
            const SizedBox(height: 20),

                const Center(
                    child: Text(
                      'No search history yet',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
