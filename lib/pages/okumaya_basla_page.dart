import 'package:flutter/material.dart';
import 'kitap_ekle_page.dart';
import 'kitapci_asistan_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> ilerlemeKaydet(
    String kitapId, int bugunOkunan, int toplamOkunan) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("bugunOkunan_$kitapId", bugunOkunan);
  await prefs.setInt("toplamOkunan_$kitapId", toplamOkunan);
}

Future<Map<String, int>> ilerlemeGetir(String kitapId) async {
  final prefs = await SharedPreferences.getInstance();
  return {
    "bugunOkunan": prefs.getInt("bugunOkunan_$kitapId") ?? 0,
    "toplamOkunan": prefs.getInt("toplamOkunan_$kitapId") ?? 0,
  };
}

class OkumayaBaslaPage extends StatefulWidget {
  final Map<String, dynamic> kitap;

  const OkumayaBaslaPage({
    Key? key,
    required this.kitap,
  }) : super(key: key);

  @override
  State<OkumayaBaslaPage> createState() => _OkumayaBaslaPageState();
}

class _OkumayaBaslaPageState extends State<OkumayaBaslaPage>
    with AutomaticKeepAliveClientMixin {
  late DateTime baslangicTarihi;
  late int toplamSayfa;
  int toplamOkunan = 0;
  int bugunOkunan = 0;

  final TextEditingController _bugunController = TextEditingController();
  final TextEditingController _toplamController = TextEditingController();

  @override
  void initState() {
    super.initState();
    baslangicTarihi = DateTime.now();
    toplamSayfa =
        int.tryParse(widget.kitap["sayfaSayisi"]?.toString() ?? "0") ?? 0;
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final data = await ilerlemeGetir(widget.kitap["id"].toString());
    setState(() {
      bugunOkunan = data["bugunOkunan"] ?? 0;
      toplamOkunan = data["toplamOkunan"] ?? 0;
      _syncControllers();
    });
  }

  void _syncControllers() {
    _bugunController.text = bugunOkunan.toString();
    _toplamController.text = toplamOkunan.toString();
  }

  double get ilerleme => toplamSayfa > 0
      ? (toplamOkunan.clamp(0, toplamSayfa) / toplamSayfa)
      : 0.0;

  void _artirBugun(int n) {
    setState(() {
      bugunOkunan = (bugunOkunan + n).clamp(0, 9999);
      _bugunController.text = bugunOkunan.toString();
    });
  }

  void _artirToplam(int n) {
    setState(() {
      toplamOkunan = (toplamOkunan + n).clamp(0, toplamSayfa);
      _toplamController.text = toplamOkunan.toString();
    });
  }

  void _kaydet() async {
    final b = int.tryParse(_bugunController.text.trim()) ?? bugunOkunan;
    final t = int.tryParse(_toplamController.text.trim()) ?? toplamOkunan;

    setState(() {
      bugunOkunan = b.clamp(0, 9999);
      toplamOkunan = t.clamp(0, toplamSayfa);
      _syncControllers();
    });

    // SharedPreferences’a kaydetme kısmı
    await ilerlemeKaydet(
        widget.kitap["id"].toString(), bugunOkunan, toplamOkunan);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("İlerleme güncellendi")),
    );
  }

  @override
  void dispose() {
    _bugunController.dispose();
    _toplamController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final kitapAd = widget.kitap["ad"] ?? "Kitap";
    final yazar = widget.kitap["yazar"] ?? "Yazar";
    final baslangicStr =
        "${baslangicTarihi.day}.${baslangicTarihi.month}.${baslangicTarihi.year}";

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/obpd.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.35)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Okumaya Başla",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 10,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kitapAd,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Yazar: $yazar",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  size: 16, color: Colors.black54),
                              const SizedBox(width: 6),
                              Text(
                                "Başlangıç: $baslangicStr",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.menu_book,
                                  size: 16, color: Colors.black54),
                              const SizedBox(width: 6),
                              Text(
                                "Toplam sayfa: $toplamSayfa",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: ilerleme,
                              minHeight: 10,
                              backgroundColor: Colors.grey.shade300,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "%${(ilerleme * 100).toStringAsFixed(1)} tamamlandı",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            "Bugün okunan sayfa",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _bugunController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Örn: 12",
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _QuickButton(
                                  label: "+5", onTap: () => _artirBugun(5)),
                              const SizedBox(width: 8),
                              _QuickButton(
                                  label: "+10", onTap: () => _artirBugun(10)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Toplam okunan sayfa",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _toplamController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Örn: 48",
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              _QuickButton(
                                  label: "+10", onTap: () => _artirToplam(10)),
                              const SizedBox(width: 8),
                              _QuickButton(
                                  label: "+25", onTap: () => _artirToplam(25)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  icon: const Icon(Icons.save),
                                  label: const Text("Kaydet"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: _kaydet,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  icon: const Icon(Icons.library_books,
                                      color: Colors.deepPurple),
                                  label: const Text("Kitaplığa Ekle"),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.deepPurple),
                                    foregroundColor: Colors.deepPurple,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "“$kitapAd” kitaplığa eklendi")),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
