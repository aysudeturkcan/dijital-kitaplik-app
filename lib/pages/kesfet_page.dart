import 'package:flutter/material.dart';
import 'category_detail_page.dart';

class KesfetPage extends StatelessWidget {
  const KesfetPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> kategoriler = const [
    {"title": "Aşk", "color": Colors.pinkAccent},
    {"title": "Fantastik", "color": Colors.deepPurple},
    {"title": "Çocuk", "color": Colors.orange},
    {"title": "Dini", "color": Colors.teal},
    {"title": "Korku", "color": Colors.redAccent},
    {"title": "Şiir", "color": Colors.indigo},
    {"title": "En Çok Okunanlar", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keşfet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: kategoriler.map((kategori) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kategori["color"],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryDetailPage(category: kategori["title"]),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book, size: 40, color: Colors.white),
                  const SizedBox(height: 10),
                  Text(
                    kategori["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
