import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class SohbetGrupPage extends StatelessWidget {
  final String? kulupAdi;
  const SohbetGrupPage({Key? key, this.kulupAdi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kulupAdi == null) {
      final kulupListesi = [
        "Tutunamayanlar Kulübü",
        "Suç ve Ceza Kulübü",
        "Harry Potter Kulübü",
      ];
      return Scaffold(
        appBar: AppBar(title: const Text("Sohbet Grupları")),
        body: ListView.builder(
          itemCount: kulupListesi.length,
          itemBuilder: (context, index) {
            final kulup = kulupListesi[index];
            return ListTile(
              title: Text(kulup),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SohbetGrupPage(kulupAdi: kulup),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return SohbetSayfasi(kulupAdi: kulupAdi!);
  }
}

class SohbetSayfasi extends StatefulWidget {
  final String kulupAdi;
  const SohbetSayfasi({Key? key, required this.kulupAdi}) : super(key: key);

  @override
  State<SohbetSayfasi> createState() => _SohbetSayfasiState();
}

class _SohbetSayfasiState extends State<SohbetSayfasi> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() async {
    final text = _controller.text.trim();

    // karşı taraf için belirli cevaplar yazıyoruz
    final cevaplar = {
      "Tutunamayanlar Kulübü": [
        "Oğuz Atay’ın dili çok yoğun ama alışınca çok etkileyici oluyor.",
        "Turgut’un yalnızlığı beni çok etkiledi.",
        "Her okuduğumda yeni bir şey fark ediyorum.",
        "Bu kitap beni derinden düşündürüyor.",
        "Yazarın ironik dili çok hoşuma gidiyor.",
        "Gerçekten Türk edebiyatının en özel eserlerinden biri."
      ],
      "Suç ve Ceza Kulübü": [
        "Raskolnikov’un psikolojisi üzerine konuşabiliriz.",
        "Suçluluk duygusu çok iyi işlenmiş.",
        "Sana en çok hangi karakter ilginç geliyor?",
        "Sonlara doğru gerilim çok artıyor.",
        "Sanki her sayfada yeni bir sorgulama var.",
        "Gerçekten insanı düşündüren bir eser."
      ],
      "Harry Potter Kulübü": [
        "Hogwarts’ta favori evin hangisi?",
        "Benim favorim Gryffindor!",
        "Fantastik dünya çok sürükleyici.",
        "Quidditch maçlarını okumak çok eğlenceli.",
        "Dumbledore’un sözleri çok etkileyici.",
        "Seri ilerledikçe karakterler çok gelişiyor."
      ],
    };

    if (text.isEmpty) return;

    try {
      // Kullanıcı mesaj kısmı
      await FirebaseFirestore.instance
          .collection("sohbet_gruplari")
          .doc(widget.kulupAdi)
          .collection("mesajlar")
          .add({
        "sender": "Sen",
        "text": text,
        "time": FieldValue.serverTimestamp(),
      });
      _controller.clear();

      // Cevap listesi
      final cevapListesi = cevaplar[widget.kulupAdi];

      if (cevapListesi != null) {
        for (var i = 0; i < cevapListesi.length; i++) {
          Future.delayed(Duration(seconds: 2 * (i + 1)), () {
            FirebaseFirestore.instance
                .collection("sohbet_gruplari")
                .doc(widget.kulupAdi)
                .collection("mesajlar")
                .add({
              "sender": "Esma",
              "text": cevapListesi[i],
              "time": FieldValue.serverTimestamp(),
            });
          });
        }
      }
    } catch (e) {
      print("Mesaj kaydedilemedi: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mesaj kaydedilemedi: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRef = FirebaseFirestore.instance
        .collection("sohbet_gruplari")
        .doc(widget.kulupAdi)
        .collection("mesajlar");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(widget.kulupAdi)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: mesajlarRef.orderBy("time", descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(12),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final veri = docs[index].data() as Map<String, dynamic>;
                    final zaman = veri["time"] as Timestamp?;
                    final saatStr = zaman != null
                        ? DateFormat.Hm().format(zaman.toDate())
                        : "";
                    final isUser = veri["sender"] == "Sen";

                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser
                              ? Colors.deepPurple.shade100
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${veri["sender"] ?? ""} • $saatStr",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color:
                                    isUser ? Colors.deepPurple : Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(veri["text"] ?? ""),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Mesaj yaz...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.deepPurple),
                    onPressed: _sendMessage,
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
