import 'dart:convert';
import 'package:flutter/material.dart';
import 'kitap_ekle_page.dart';
import 'okumaya_basla_page.dart';
import 'package:http/http.dart' as http;

// gömülü kitap listesi
final kitaplar = [
  {
    'id': 'hp_1',
    'ad': 'Harry Potter ve Felsefe Taşı',
    'yazar': 'J.K. Rowling',
    'kapak': 'assets/images/kitaplar/hp_1.jpg',
    'ozet': 'Harry Potterın ilk kitabı...',
    'basimYili': '1997',
    'sayfaSayisi': '274',
    'dil': 'Türkçe',
  },
  {
    'id': 'gurur_ve_onyargi',
    'ad': 'Gurur ve Önyargı',
    'yazar': 'Jane Austen',
    'kapak': 'assets/images/kitaplar/ask_ve_gurur.jpg',
    'ozet': 'Aşk ve toplumsal sınıflar üzerine klasik roman.',
    'basimYili': '1813',
    'sayfaSayisi': '432',
    'dil': 'Türkçe',
  },
  {
    'id': 'kucuk_prens',
    'ad': 'Küçük Prens',
    'yazar': 'Antoine de Saint-Exupéry',
    'kapak': 'assets/images/kitaplar/kucuk_prens.jpg',
    'ozet': 'Çocuklar ve yetişkinler için felsefi bir masal.',
    'basimYili': '1943',
    'sayfaSayisi': '96',
    'dil': 'Türkçe',
  },
  {
    'ad': 'İçimizdeki Şeytan',
    'id': 'icimizdeki_seytan',
    'yazar': 'Sabahattin Ali',
    'ozet':
        "Sabahattin Ali’nin, yayımlandığı dönemde uzun tartışmalara sebep olan İçimizdeki Şeytan kitabı, milliyetçilik, elitizm, toplumsal cinsiyet gibi kavramların hayata yansımalarını nitelikli bir kurguyla açıklıyor. Karakterlerin vicdan ve akıl arasında sıkıştığı bir anda, “İçimizdeki Şeytan” ortaya çıkıyor. Kitabın ana karakterlerinden Ömer’in yaşanan bütün haksızlıklara, kötülüklere izahı bu ifadede saklıdır. Ömer prototipi üzerinden irade zayıflığını, kararsızlığı, olumsuzluklara hayır diyememeyi, yanlışlıklara direnememeyi ve bunların yol açtığı dramatik sonuçları konu edinen eser, Ali’nin ikinci romanı olma özelliğini taşıyor.",
    'basimYili': '17.01.2019',
    'sayfaSayisi': '300',
    'dil': 'Türkçe (çeviri)',
    'kapak': 'assets/images/kitaplar/icimizdeki_seytan.jpg',
  },
  {
    'ad': 'Suç ve Ceza',
    'id': 'suc_ve_ceza',
    'yazar': 'Fyodor Dostoyevski',
    'ozet':
        " Dostoyevski, insanın karanlık yakasını kendinden sonraki bütün romancıları derinden etkileyecek biçimde dile getirmiş büyük bir 19. yüzyıl ustasıdır.",
    'basimYili': '18.03.2022',
    'sayfaSayisi': '704',
    'dil': 'Türkçe (çeviri)',
    'kapak': 'assets/images/kitaplar/suc_ve_ceza.jpg',
  },
  {
    'id': 'labirent_1',
    'ad': 'Labirent-1',
    'yazar': 'James Dashner',
    'ozet':
        "Hatırla. Hayatta kal. Koş.Thomas bir asansörde uyandığında hatırlayabildiği tek şey ismidir.Ailesini, evini veya oraya nasıl geldiğini anımsamamaktadır. Zihni bomboştur..",
    'basimYili': '14.04.2017',
    'sayfaSayisi': '408',
    'dil': 'Türkçe (çeviri)',
    'kapak': 'assets/images/kitaplar/labirent_1.jpg',
  },
  {
    'id': 'dil_belasi_',
    'ad': 'Dil Belası',
    'yazar': 'İmam Gazali',
    'ozet':
        "“İnsanın, dilini kullandığında övüleceği veya kınanacağı hususları bilmesi çok zor bir meseledir. Dilin yaratılış gayesine göre hareket etmeyi bilen kişiye ise bu şartlara uymak çok ağır gelir.",
    'basimYili': '03.10.2024',
    'sayfaSayisi': '176',
    'dil': 'Türkçe ',
    'kapak': 'assets/images/kitaplar/dil_belasi_.jpg',
  },
  {
    'id': 'it',
    'ad': 'It',
    'yazar': 'Stephen King',
    'ozet':
        "Küçük bir Amerikan kasabası olan Derry’yi diğer kasabalardan farklı kılan şey, kanalizasyon mazgallarının altındaki dehlizlerde yaşayan, kendini kimi zaman kâbuslarda, kimi zaman da gerçek hayatta gösteren esrarengiz bir yaratığın varlığıdır.",
    'basimYili': '03.12.2025',
    'sayfaSayisi': '1064',
    'dil': 'Türkçe (çeviri)',
    'kapak': 'assets/images/kitaplar/it.jpg',
  },
  {
    'id': 'ahlar_agaci',
    'ad': 'Ahlar Ağacı',
    'yazar': 'Didem Madak',
    'ozet': '...',
    'basimYili': '15.09.2020',
    'sayfaSayisi': '76',
    'dil': 'Türkçe',
    'kapak': 'assets/images/kitaplar/ahlar_agaci.jpg',
  },
  {
    'id': 'hayvan_ciftligi',
    'ad': 'Hayvan Çiftliği',
    'yazar': 'George Orwell',
    'ozet':
        "George Orwell’in alegorik romanı Hayvan Çiftliği, totaliter rejimlerin eleştirisini fabl tarzında sunar.",
    'basimYili': '1945',
    'sayfaSayisi': '112',
    'dil': 'Türkçe (çeviri)',
    'kapak': 'assets/images/kitaplar/hayvan_ciftligi.jpg',
  },
];

class KitapciAsistanPage extends StatefulWidget {
  final List<Map<String, dynamic>> kitaplar;

  const KitapciAsistanPage({Key? key, required this.kitaplar})
      : super(key: key);

  @override
  State<KitapciAsistanPage> createState() => _KitapciAsistanPageState();
}

class _KitapciAsistanPageState extends State<KitapciAsistanPage> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  String? _lastSuggestedBook;
  bool _isSending = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    final text = controller.text.trim();
    if (text.isEmpty || _isSending) return;

    setState(() {
      _messages.add({
        "sender": "kullanici",
        "text": text,
        "time": TimeOfDay.now().format(context),
      });
      _isSending = true;
    });
    controller.clear();

    final response = await _callAI(text);
    _lastSuggestedBook = _extractBookName(response);

    setState(() {
      _messages.add({
        "sender": "asistan",
        "text": response,
        "time": TimeOfDay.now().format(context),
      });
      _isSending = false;
    });
  }

  Future<String> _callAI(String userMessage) async {
    const apiKey =
        "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"; // OpenRouter API key'ini buraya koy
    final url = Uri.parse("https://openrouter.ai/api/v1/chat/completions");

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
      // İsteğe bağlı ama faydalı metadata:
      "HTTP-Referer": "https://your-app.example",
      "X-Title": "Book Club Assistant",
    };

    final kitaplarData = """
Kategoriler ve kitaplar:
- Aşk: Gurur ve Önyargı (Jane Austen)
- Fantastik: Harry Potter ve Felsefe Taşı (J.K. Rowling)
- Çocuk: Küçük Prens (Antoine de Saint-Exupéry)
- Korku: It (Stephen King)
- Şiir: "Ahlar Ağacı (Didem Madak)
- Edebiyet Klasikleri: İçimizdeki Şeytan (Sabahattin Ali)
- Dini: Kuranda Karakter İnşası (Yasin Pişkin)
- Aksiyon: Labirent-1 (James Dashner)
- Dünya Klasikleri:Suç ve Ceza (Fyodor Dostoyevski)
- Çok Satanlar: Hayvan Çiftliği (George Orwell)
""";

    final body = jsonEncode({
      "model": "openai/gpt-oss-20b",
      "messages": [
        {
          "role": "system",
          "content":
              "Sen bir kitap öneri asistanısın. Kullanıcıya listedeki kitaplardan öneri yaparken, neden o kitabı önerdiğini kısa bir açıklamayla belirt. Yanıtın sıcak, sohbet tarzında ve yardımcı olmalı. Gerektiğinde kategori hakkında kısa bilgi verebilirsin.\n$kitaplarData\nYanıtını kısa ve net ver, yalnızca listedeki kitaplardan öner."
        },
        {"role": "user", "content": userMessage}
      ]
    });

    try {
      final res = await http.post(url, headers: headers, body: body);

      // Debug için:
      // print("Status code: ${res.statusCode}");
      // print("Response body: ${res.body}");

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final content = data["choices"]?[0]?["message"]?["content"];
        return (content is String && content.isNotEmpty)
            ? content
            : "Boş yanıt.";
      } else {
        return "Üzgünüm, şu anda cevap veremiyorum (${res.statusCode}).";
      }
    } catch (e) {
      return "İstek sırasında bir hata oluştu: $e";
    }
  }

  String? _extractBookName(String response) {
    // 1. Çift tırnak içinde kitap adı varsa yakala
    final m1 = RegExp(r'"([^"]+)"').firstMatch(response);
    if (m1 != null) return m1.group(1);

    // 2. Tek tırnak içinde kitap adı varsa yakala
    final m2 = RegExp(r"'([^']+)'").firstMatch(response);
    if (m2 != null) return m2.group(1);

    // 3. Yanıtı küçük harfe çevirip kitap listesiyle karşılaştır
    final lowerResp = response.toLowerCase();
    for (final k in kitaplar) {
      final ad = (k["ad"] as String?)?.trim();
      if (ad == null || ad.isEmpty) continue;
      if (lowerResp.contains(ad.toLowerCase())) return ad;
    }

    // 4. "kitap" kelimesinden önceki ifadeyi yakala (Türkçe)
    final loose =
        RegExp(r'([A-ZÇĞİÖŞÜ][^\.!\n]+?)\s+kitap').firstMatch(response);
    if (loose != null) return loose.group(1)?.trim();

    // 5. Hiçbir şey bulunmazsa null
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KİTAPÇI", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple.shade700,
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // lila arka plan
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, i) {
                  final msg = _messages[i];
                  final isUser = msg["sender"] == "kullanici";
                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      constraints: const BoxConstraints(maxWidth: 280),
                      decoration: BoxDecoration(
                        color:
                            isUser ? Colors.deepPurple.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(msg["text"] ?? ""),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              msg["time"] ?? "",
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_lastSuggestedBook != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.book),
                  label: Text("“$_lastSuggestedBook” kitabına git"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final kitap = widget.kitaplar.firstWhere(
                      (k) =>
                          (k["ad"] as String).toLowerCase().trim() ==
                          _lastSuggestedBook!.toLowerCase().trim(),
                    );

                    if (kitap == null) {
                      print("Kitap eşleşmesi bulunamadı.");
                      return;
                    }

                    // String’e dönüştürme kısmı
                    String kitapId = (kitap["id"] ?? "").toString();
                    String kitapAdi = (kitap["ad"] ?? "").toString();
                    String yazarAdi = (kitap["yazar"] ?? "").toString();
                    String kapak = (kitap["kapak"] ?? "").toString();
                    String ozet = (kitap["ozet"] ?? "Özet bilgisi eklenmemiş.")
                        .toString();
                    String basimYili = (kitap["basimYili"] ?? "").toString();
                    String sayfaSayisi =
                        (kitap["sayfaSayisi"] ?? "").toString();
                    String dil = (kitap["dil"] ?? "").toString();

                    // Boş zorunlu alan kontrolü (isteğe bağlı)
                    if (kitapAdi.isEmpty || yazarAdi.isEmpty) {
                      print("Zorunlu alanlar eksik: kitapAdi/yazarAdi");
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KitapEklePage(
                          kitapId: kitapId,
                          kitapAdi: kitapAdi,
                          yazarAdi: yazarAdi,
                          kapak: kapak,
                          ozet: ozet,
                          basimYili: basimYili,
                          sayfaSayisi: sayfaSayisi,
                          dil: dil,
                        ),
                      ),
                    );
                  },
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: const Color.fromARGB(255, 145, 99, 214), // alt bar lila
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Mesaj yaz...",
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: _isSending
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          )
                        : const Icon(Icons.send, color: Colors.white),
                    onPressed: _isSending ? null : sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
