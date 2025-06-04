import 'package:flutter/material.dart';

class BeautyProfileScreen extends StatefulWidget {
  const BeautyProfileScreen({super.key});

  @override
  State<BeautyProfileScreen> createState() => _BeautyProfileScreenState();
}

class _BeautyProfileScreenState extends State<BeautyProfileScreen> {
  String? selectedSkinType;

  final List<Map<String, String>> skinTypes = [
    {
      'label': 'Dry Skin',
      'image': 'images/dry_skin.jpg', // You need to add this image to your assets
      'info': 'Dry skin tends to feel tight and may have flaky patches.',
    },
    {
      'label': 'Normal Skin',
      'image': 'images/normal_skin.jpg', // Add this image to your assets
      'info': 'Normal skin is well balanced, not too oily or dry.',
    },
    {
      'label': 'Combination',
      'image': 'images/combination_skin.jpg', // Add this image to your assets
      'info': 'Combination skin has both oily and dry areas.',
    },
    {
      'label': 'Oily Skin',
      'image': 'images/oily_skin.jpg', // Add this image to your assets
      'info': 'Oily skin produces excess sebum and may appear shiny.',
    },
  ];

  void _showInfoDialog(String info) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Info'),
        content: Text(info),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _saveSelection() {
    if (selectedSkinType != null) {
      // Save the selection or pass it back
      Navigator.of(context).pop(selectedSkinType);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan pilih jenis kulit')),
      );
    }
  }

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
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.pink),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lengkapi Profile Kecantikanmu\nuntuk mendapatkan rekomendasi produk',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: skinTypes.length,
                itemBuilder: (context, index) {
                  final skin = skinTypes[index];
                  final isSelected = selectedSkinType == skin['label'];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: isSelected ? Colors.pink : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          skin['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        skin['label']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.help_outline, color: Colors.grey),
                            onPressed: () => _showInfoDialog(skin['info']!),
                          ),
                          Checkbox(
                            value: isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedSkinType = skin['label'];
                                } else {
                                  selectedSkinType = null;
                                }
                              });
                            },
                            activeColor: Colors.pink,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          selectedSkinType = skin['label'];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSelection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                    fontFamily: 'FleurDeLeah',
                    fontSize: 18,
                    color: Colors.white,
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