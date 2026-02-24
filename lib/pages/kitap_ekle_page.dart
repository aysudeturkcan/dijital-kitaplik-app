import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/kitapci_asistan_page.dart';
import 'package:flutter_application_1/pages/okumaya_basla_page.dart';

class KitapEklePage extends StatelessWidget {
  final String kitapId;
  final String kitapAdi;
  final String yazarAdi;
  final String kapak;
  final String ozet;
  final String basimYili;
  final String sayfaSayisi;
  final String dil;

  const KitapEklePage({
    Key? key,
    required this.kitapId,
    required this.kitapAdi,
    required this.yazarAdi,
    required this.kapak,
    required this.ozet,
    required this.basimYili,
    required this.sayfaSayisi,
    required this.dil,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(kitapAdi.isNotEmpty ? kitapAdi : "Kitap Detayı"),
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Detaylar"),
              Tab(text: "Yorumlar"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        kapak,
                        width: 180,
                        height: 260,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(kitapAdi,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(yazarAdi,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(137, 21, 20, 20))),
                  const SizedBox(height: 16),
                  const Text("Hakkında",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _infoRow("Basım Yılı", basimYili),
                  _infoRow("Sayfa Sayısı", sayfaSayisi),
                  _infoRow("Dil", dil),
                  const SizedBox(height: 16),
                  const Text("📖 İçerik Özeti",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(ozet.isNotEmpty ? ozet : "Özet bilgisi eklenmemiş.",
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final kitap = {
                              "id": kitapId,
                              "ad": kitapAdi,
                              "yazar": yazarAdi,
                              "kapak": kapak,
                              "ozet": ozet,
                              "basimYili": basimYili,
                              "sayfaSayisi": sayfaSayisi,
                              "dil": dil,
                            };

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OkumayaBaslaPage(kitap: kitap),
                              ),
                            );
                          },
                          child: const Text("OKUMAYA BAŞLA"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Kitaplığına eklendi")),
                            );
                          },
                          child: const Text("KİTAPLIĞIMA EKLE"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _CommentsTab(kitapId: kitapId),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    final safe = value.isNotEmpty ? value : "—";
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(safe)),
        ],
      ),
    );
  }
} // yorum sekmesi burda bulunuyor

class _CommentsTab extends StatefulWidget {
  final String kitapId;
  const _CommentsTab({Key? key, required this.kitapId}) : super(key: key);
  @override
  State<_CommentsTab> createState() => _CommentsTabState();
}

class _CommentsTabState extends State<_CommentsTab> {
  final _yorumController = TextEditingController();
  int _rating = 0;
  final List<Map<String, String>> _yorumlar = [];
  @override
  void dispose() {
    _yorumController.dispose();
    super.dispose();
  }

  void _sendRating(int value) {
    setState(() => _rating = value);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Puanlama gönderildi")),
    );
  }

  void _sendComment() {
    final text = _yorumController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _yorumlar.insert(0, {
        "user": "Kullanıcı",
        "yorum": text,
        "rating": _rating.toString(),
      });
    });
    _yorumController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Yorum gönderildi")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Kitabı Değerlendir",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            children: List.generate(5, (i) {
              return IconButton(
                icon: Icon(
                  i < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () => _sendRating(i + 1),
              );
            }),
          ),
          const SizedBox(height: 16),
          const Text("Yorum Yaz",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _yorumController,
            decoration: InputDecoration(
              hintText: "Yorumunu buraya yaz...",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendComment,
              ),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          const Text("Yorumlar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: _yorumlar.isEmpty
                ? const Center(child: Text("Henüz yorum yok"))
                : ListView.separated(
                    itemCount: _yorumlar.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final y = _yorumlar[i];
                      return Card(
                        child: ListTile(
                          title: Text(y["yorum"] ?? ""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kullanıcı: ${y["user"]}"),
                              Text("Puan: ${y["rating"]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
