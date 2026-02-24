import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Tüm sayfalar import edilmeli
import 'pages/login_page.dart';
import 'pages/kitapligim_page.dart';
import 'pages/kitapci_asistan_page.dart';
import 'pages/kitap_ekle_page.dart';
import 'pages/kesfet_page.dart';
import 'pages/sohbet_grup_page.dart';
import 'pages/okumaya_basla_page.dart';

/*????????*/
final Map<String, dynamic> seciliKitap = {
  "id": "tutunamayanlar",
  "ad": "Tutunamayanlar",
  "yazar": "Oğuz Atay",
  "sayfaSayisi": "724",
  "kapak": "assets/images/kitaplar/obpd.png",
  "ozet": "Modern Türk edebiyatının en önemli eserlerinden biri.",
  "dil": "Türkçe",
  "baslangicTarihi": "20.1.2026",
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DijitalKitapligim());
}

class DijitalKitapligim extends StatelessWidget {
  const DijitalKitapligim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dijital Kitaplığım',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LoginPage(), // Açılışta LoginPage
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    KitapligimPage(),
    KitapciAsistanPage(kitaplar: kitaplar),
    const SohbetGrupPage(),
    const KesfetPage(),
    OkumayaBaslaPage(kitap: seciliKitap),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Kitaplık',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Kitapçı Asistan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Sohbet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Keşfet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Okumaya Başla',
          ),
        ],
      ),
    );
  }
}
