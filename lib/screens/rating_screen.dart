import 'package:flutter/material.dart';

void main() {
  runApp(SkinMatchApp());
}

class SkinMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReviewPage(),
    );
  }
}

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _selectedRating = 0;
  String? _errorMessage; // Untuk menyimpan pesan error

  void _onRatingSelected(int index) {
    setState(() {
      _selectedRating = index + 1;
      _errorMessage = null; // Menghapus pesan error saat rating dipilih
    });
  }

  void _submitReview(BuildContext context) {
    if (_selectedRating == 0) {
      // Jika rating belum dipilih, tampilkan pesan error
      setState(() {
        _errorMessage = 'Silakan pilih rating terlebih dahulu.';
      });
    } else {
      // Jika rating valid, tampilkan dialog konfirmasi
      _showReviewSubmittedDialog(context);
    }
  }

  void _showReviewSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ulasan Terkirim'),
          content: const Text('Terima kasih telah memberikan ulasan!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Menutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ulasan',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Star Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < _selectedRating ? Colors.pink : Colors.grey,
                  ),
                  onPressed: () => _onRatingSelected(index),
                );
              }),
            ),
            if (_errorMessage != null) // Menampilkan pesan error jika ada
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            SizedBox(height: 16),

            // Review Text Field
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tulis Ulasan ...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 16),

            // Usage Period Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Usage Period',
                hintText: 'Durasi pemakaian',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 16),

            // Purchase Point Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Purchase Point',
                hintText: 'Tempat pembelian',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            SizedBox(height: 24),

            // Submit Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  _submitReview(context); // Validasi rating sebelum submit
                },
                child: Text(
                  'Kirim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}