import 'package:flutter/material.dart';
import 'kitap_ekle_page.dart'; // KitapEklePage'i import etmeyi unutma

class KitapligimPage extends StatelessWidget {
  KitapligimPage({Key? key}) : super(key: key);

  final List<Map<String, String>> kitapListesi = [
    {
      'id': 'tutunamayanlar',
      'ad': 'Tutunamayanlar',
      'yazar': 'Oğuz Atay',
      'ozet':
          'Türk edebiyatının en önemli eserlerinden biri olan Tutunamayanlar, küçük burjuva dünyasını zekice alaya alır.',
      'basimYili': '1971',
      'sayfaSayisi': '724',
      'dil': 'Türkçe',
      'kapak': 'assets/images/kitaplar/tutunamayanlar.jpg',
    },
    {
      'id': 'hayvan-ciftligi',
      'ad': 'Hayvan Çiftliği',
      'yazar': 'George Orwell',
      'ozet':
          "George Orwell’in alegorik romanı Hayvan Çiftliği, totaliter rejimlerin eleştirisini fabl tarzında sunar.",
      'basimYili': '1945',
      'sayfaSayisi': '152',
      'dil': 'Türkçe',
      'kapak': 'assets/images/kitaplar/hayvan_ciftligi.jpg',
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
      'id': 'labirent_2',
      'ad': 'Labirent-2',
      'yazar': 'James Dashner',
      'ozet':
          "Labirent bulmacası çözülünce her şeyin sona ermesi gerekiyordu…Thomas, Labirent’ten kaçışın tüm Kayranlılar için özgürlük anlamına geldiğini düşünmektedir. Fakat İSYAN’ın işi henüz bitmemiştir. İkinci Aşama daha yeni başlamıştır:",
      'basimYili': '19.08.2016',
      'sayfaSayisi': '400',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/labirent_2.jpg',
    },
    {
      'id': 'labirent_3',
      'ad': 'Labirent-3',
      'yazar': 'James Dashner',
      'ozet':
          "Her şeyin sonu geldi! İSYAN, Thomas’ın her şeyini almıştır: hayatını, anılarını ve sonunda arkadaşı olan Kayranlıları. Ama artık sona ermiştir. Son bir testin ardından Deneyler tamamlanmıştır.",
      'basimYili': '29.05.2017',
      'sayfaSayisi': '384',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/labirent_3.jpg',
    },
    {
      "id": "hp_1",
      'ad': 'Harry Potter ve Felsefe Taşı',
      'yazar': 'J.K. Rowling',
      "ozet":
          "“Harry, elleri titreyerek zarfı çevirince mor balmumundan bir mühür gördü; bir arma – koca bir ‘H’ harfinin çevresinde bir aslan, bir kartal, bir porsuk, bir de yılan.”",
      "basimYili": "07.10.2023",
      "sayfaSayisi": "274",
      "dil": "Türkçe (çeviri)",
      "kapak": "assets/images/kitaplar/hp_1.jpg",
    },
    {
      "id": "hp_2",
      'ad': 'Harry Potter ve Sırlar Odası',
      'yazar': 'J.K. Rowling',
      "ozet":
          "“Bir komplo var, Harry Potter. Bu yıl Hogwarts Cadılık ve Büyücülük Okulu’nda dehşet verici şeyler yapmak için bir komplo.”",
      "basimYili": "29.08.2019",
      "sayfaSayisi": "314",
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/hp_2.jpg',
    },
    {
      'id': 'hp_3',
      'ad': 'Harry Potter ve Azkaban Tutsağı',
      'yazar': 'J.K. Rowling',
      'ozet':
          '“Mahsur kalmış cadıların ve büyücülerin acil durum taşıtı Hızır Otobüs’e hoş geldiniz. Asanızı tuttuğunuz elinizi uzatın, otobüse atlayın, sizi istediğiniz yere götürelim.”',
      'basimYili': '30.06.2022',
      'sayfaSayisi': '396',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/hp_3.jpg',
    },
    {
      'id': 'hp_4',
      'ad': 'Harry Potter ve Ateş Kadehi',
      'yazar': 'J.K. Rowling',
      'ozet':
          "Harry Potter'ın büyücülük okulundaki dördüncü yılında başından geçenleri anlatan Harry Potter ve Ateş Kadehi, dizinin önceki kitaplarında tanık olduğumuzdan hem çok daha eğlenceli, hem çok daha ürkütücü bir büyücülük dünyasının kapılarını açıyor.",
      'basimYili': '31.10.2019',
      'sayfaSayisi': '664',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/hp_4.jpg',
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
      'ad': 'Sineklerin Tanrısı',
      'id': 'sineklerin_tanrisi',
      'yazar': 'William Golding',
      'ozet':
          "“Sineklerin Tanrısı başlangıçta, ıssız bir adaya düşen çocukların serüvenlerini anlatan, küçükler için yazılmış bir öykü, R.M. Ballantyne’ın Mercan Adası’nın çağdaş bir uygulaması sanılabilir.",
      'basimYili': '25.07.2019',
      'sayfaSayisi': '261',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/sineklerin_tanrisi.jpg',
    },
    {
      'ad': 'Martin Eden',
      'id': 'martin_eden',
      'yazar': 'Jack London',
      'ozet':
          "Jack London’ın, kendi hayatından izler taşıyan romanı Martin Eden, denizci bir gencin kişiliğinden ödün vermeden sınıf atlama çabalarını anlatıyor.",
      'basimYili': '25.04.2019',
      'sayfaSayisi': '496',
      'dil': 'Türkçe (çeviri)',
      'kapak': 'assets/images/kitaplar/martin_eden.jpg',
    },
    {
      "ad": "Şeker Portakalı",
      "id": "seker_portakali",
      "yazar": "José Mauro de Vasconcelos",
      "ozet":
          "“Ne güzel bir şeker portakalı fidanıymış bu! Hem bak, dikeni de yok. Pek de kişilik sahibiymiş, şeker portakalı olduğu ta uzaktan belli. Ben senin boyunda olsaydım başka şey istemezdim.”",
      "basimYili": "06.09.2019",
      "sayfaSayisi": "184",
      "dil": "Türkçe (çeviri)",
      "kapak": "assets/images/kitaplar/seker_portakali.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Kitaplığım",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: kitapListesi.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, i) {
            final kitap = kitapListesi[i];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KitapEklePage(
                      kitapId: kitap['id']!,
                      kitapAdi: kitap['ad'] ?? "Bilinmiyor",
                      yazarAdi: kitap['yazar'] ?? "Bilinmiyor",
                      kapak: kitap['kapak']!,
                      ozet: kitap['ozet'] ?? "",
                      basimYili: kitap['basimYili'] ?? "",
                      sayfaSayisi: kitap['sayfaSayisi'] ?? "",
                      dil: kitap['dil'] ?? "",
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      kitap['kapak']!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 60),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
