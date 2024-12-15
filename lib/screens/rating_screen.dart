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

  void _onRatingSelected(int index) {
    setState(() {
      _selectedRating = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () {
            // Back button functionality
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ulasan',
          style: TextStyle(
            color: Colors.pink.shade200,
            fontFamily: 'FeurDeLeah',
            fontSize: 20,
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
                  // Submit functionality
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
