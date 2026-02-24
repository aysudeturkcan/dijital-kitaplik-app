import 'package:flutter/material.dart';
import 'kitap_ekle_page.dart';

class CategoryDetailPage extends StatelessWidget {
  final String category;

  const CategoryDetailPage({required this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> onsozler = {
      "Aşk": """Ama şu 'delicesine aşık' ifadesi o kadar klişe,
o kadar şüpheli, o kadar belirsiz ki bana pek bir fikir vermiyor.
Gerçek ve güçlü bir bağlılık için kullanıldığı kadar yarım saatlik bir tanışmadan
kaynaklanan hisler içinde sıklıkla kullanılıyor...
– Jane Austen""",
      "Fantastik":
          "Mutluluk en karanlık zamanlarda bile bulunabilir sadece ışıkları yakmayı unutma!\n~ Albus Dumbledore",
      "Çocuk": """Dünyada bir tane çocuk dahi mutsuz olduğu sürece
büyük icatlar ve ilerlemeler hiçtir.
– Oya Akbaş""",
      "Dini":
          "Bazen öyle sözler sarfedersin ki eğer konuşmamış olsaydın günaha girmeyeceğin gibi, şimdi ve ileride de zarara uğramazdın.\n– İmam Gazali",
      "Korku":
          "İnsanların hastalıkları kafalarında başlar, Eddie.\n– Stephen King",
      "Şiir":
          "Bir gece kalkıp bütün ışıkları yakacağım Füsun Şiirime ışıktan bir nokta koyacağım.\n– Didem Madak",
      "En Çok Okunanlar":
          "70'li yıllardaydık önemli olan güzel olmak değil aydın olmaktı ve, oturup kitap okumak yerine güzelliği için zaman harcayan kızlarla dalga geçilirdi.\n– Ayfer Tunç",
    };

    final Map<String, List<Map<String, String>>> kitaplar = {
      "Aşk": [
        {
          "id": "ask_ve_gurur",
          "title": "Gurur ve Önyargı",
          "author": "Jane Austen",
          "image": "ask_ve_gurur.jpg",
          "ozet":
              "Aşk ve Gurur, taşralı bir beyefendinin kızı olan Elizabeth Bennett ile varlıklı ve soylu toprak sahibi Fitzwilliam Darcy arasındaki çatışmayı anlatır. Gerçi Jane Austen bu iki karakteri birbirlerinin tuzağına düşmüş kişiler gibi sunar, ama “ilk izlenim”i tersine çevirmekte gecikmez: Soyluluk ve servetten kaynaklanan “gurur” ile Elizabeth’in ailesinin soylu olmayışı karşısında beslediği “önyargı”, Darcy’yi mesafeli davranmak zorunda bırakır. Elizabeth’in davranışında da hem özsaygının uyandırdığı “gurur”, hem de Darcy’nin züppeliği karşısındaki “önyargı” etkili olur. Zeki ve coşkulu Elizabeth yalnızca Austen’ın en çok sevdiği kadın kahramanı değil, aynı zaman bütün İngiliz edebiyatının en çok ilgi uyandıran kadın roman kişiliklerinden biridir.",
          "basimYili": "07.12.2018",
          "sayfaSayisi": "444",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "jane_eyre",
          "title": "Jane Eyre",
          "author": "Charlotte Brontë",
          "image": "jane_eyre.jpg",
          "ozet":
              "Jane Eyre on yaşında öksüz kaldığı için ona kötü davranan yengesinin evinde yaşamaktadır. Yengesi Bayan Reed en sonunda çareyi kuzenleri tarafından da zorbalığa uğrayan Jane’i yatılı okula yollamakta bulur.",
          "basimYili": "09.02.2018",
          "sayfaSayisi": "496",
          "dil": "Türkçe (çeviri)"
        },
      ],
      "Fantastik": [
        {
          "id": "hp_1",
          "title": "Harry Potter ve Felsefe Taşı",
          "author": "J.K. Rowling",
          "image": "hp_1.jpg",
          "ozet":
              "“Harry, elleri titreyerek zarfı çevirince mor balmumundan bir mühür gördü; bir arma – koca bir ‘H’ harfinin çevresinde bir aslan, bir kartal, bir porsuk, bir de yılan.”",
          "basimYili": "07.10.2023",
          "sayfaSayisi": "274",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_2",
          "title": "Harry Potter ve Sırlar Odası",
          "author": "J.K. Rowling",
          "image": "hp_2.jpg",
          "ozet":
              "“Bir komplo var, Harry Potter. Bu yıl Hogwarts Cadılık ve Büyücülük Okulu’nda dehşet verici şeyler yapmak için bir komplo.”",
          "basimYili": "29.08.2019",
          "sayfaSayisi": "314",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_3",
          "title": "Harry Potter ve Azkaban Tutsağı",
          "author": "J.K. Rowling",
          "image": "hp_3.jpg",
          "ozet":
              "“Mahsur kalmış cadıların ve büyücülerin acil durum taşıtı Hızır Otobüs’e hoş geldiniz. Asanızı tuttuğunuz elinizi uzatın, otobüse atlayın, sizi istediğiniz yere götürelim.”",
          "basimYili": "30.06.2022",
          "sayfaSayisi": "396",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_4",
          "title": "Harry Potter ve Ateş Kadehi",
          "author": "J.K. Rowling",
          "image": "hp_4.jpg",
          "ozet":
              "Harry Potter'ın büyücülük okulundaki dördüncü yılında başından geçenleri anlatan Harry Potter ve Ateş Kadehi, dizinin önceki kitaplarında tanık olduğumuzdan hem çok daha eğlenceli, hem çok daha ürkütücü bir büyücülük dünyasının kapılarını açıyor.",
          "basimYili": "31.10.2019",
          "sayfaSayisi": "664",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_5",
          "title": "Harry Potter ve Zümrüdüanka Yoldaşlığı",
          "author": "J.K. Rowling",
          "image": "hp_5.jpg",
          "ozet":
              "“Kanıtlar, bazen, zihninin en rahat ve etkiye en açık olduğu durumlarında –örneğin uyurken– Karanlık Lord’un düşüncelerini ve duygularını paylaştığına işaret ediyor. Müdür bunun devam etmesini uygun bulmuyor. Benim sana, zihnini Karanlık Lord’a karşı nasıl kapatacağını öğretmemi istiyor.”",
          "basimYili": "21.09.2023",
          "sayfaSayisi": "975",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_6",
          "title": "Harry Potter ve Melez Prens",
          "author": "J.K. Rowling",
          "image": "hp_6.jpg",
          "ozet":
              "“İşte orada, okulun tepesinde, gökte asılı duruyordu: o yılan dilli, parıl parıl parlayan yeşil kafatası; Ölüm Yiyen’lerin bir binaya girdiklerinde... birilerini öldürdüklerinde arkalarında bıraktıkları işaret...”",
          "basimYili": "06.09.2019",
          "sayfaSayisi": "594",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hp_7",
          "title": "Harry Potter ve Ölüm Yadigarları",
          "author": "J.K. Rowling",
          "image": "hp_7.jpg",
          "ozet":
              "“Bana Harry Potter’ı verin,” dedi Voldemort’un sesi, “kimseye zarar gelmesin. Bana Harry Potter’ı verin, okula dokunmayayım. Bana Harry Potter’ı verin, ödüllendirilin.”",
          "basimYili": "17.05.2019",
          "sayfaSayisi": "690",
          "dil": "Türkçe (çeviri)"
        },
      ],
      "Çocuk": [
        {
          "id": "buyuk_macera",
          "title": "Büyük Macera",
          "author": "Elina Ellis",
          "image": "buyuk_macera.jpg",
          "ozet":
              "Ayı, Tilki ve Kanada geyiği gerçekten BÜYÜK bir macera yaşamak istiyorlar. Planlar yapıyorlar – Afrika’ya mı gitsek, yoksa Kuzey Kutbu’na mı? Yoo, Ay’a gidelim!",
          "basimYili": "01.03.2024",
          "sayfaSayisi": "28",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "kaybolan_eldiven",
          "title": "Kaybolan Eldiven",
          "author": "Sharon Harmer,Aylin Gergin",
          "image": "kaybolan_eldiven.jpg",
          "ozet":
              "Ormanda köpeğiyle birlikte odun toplayan yaşlı bir adam, eve dönerken eldiveninin tekini düşürür. Karların üzerine düşen eldivenin içinde önce Farecik ısınır. Çok geçmeden arkadaşları da gelir... ",
          "basimYili": "14.05.2022",
          "sayfaSayisi": "32",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "kucuk_prens",
          "title": "Küçük Prens",
          "author": "Antoine de Saint-Exupéry",
          "image": "kucuk_prens.jpg",
          "ozet":
              "Yüzlerce dile çevrilen, her yaştan insana hitap eden ender klasiklerden biri olan Küçük Prens, baştan sona bir güzellik öyküsüdür. Küçük Prens’in dünyasını güzel kılan; çöldeki bir kuyunun, gökteki bir yıldızın, uzaktaki bir gülün güzelliğidir.",
          "basimYili": "15.03.2017",
          "sayfaSayisi": "120",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "sevginin_gucu",
          "title": "Sevginin Gücü",
          "author": "Caroline Richards,Ülker Yıldırımcan",
          "image": "sevginin_gucu.jpg",
          "ozet": "...",
          "basimYili": "2025",
          "sayfaSayisi": "74",
          "dil": "Türkçe (çeviri)",
        },
      ],
      "Dini": [
        {
          "id": "dil_belasi_",
          "title": "Dil Belası",
          "author": "İmam Gazali",
          "image": "dil_belasi_.jpg",
          "ozet":
              "“İnsanın, dilini kullandığında övüleceği veya kınanacağı hususları bilmesi çok zor bir meseledir. Dilin yaratılış gayesine göre hareket etmeyi bilen kişiye ise bu şartlara uymak çok ağır gelir.",
          "basimYili": "03.10.2024",
          "sayfaSayisi": "176",
          "dil": "Türkçe ",
        },
        {
          "id": "iman_ve_kufur_muvazeneleri_",
          "title": "İman ve Küfür Muvazeneleri",
          "author": "Said Nursi",
          "image": "iman_ve_kufur_muvazeneleri_.jpg",
          "ozet":
              "Risale-i Nur Külliyatından aynı konuyla alâkalı parçalar bir araya getirilerek hazırlanmıştır. ",
          "basimYili": "16.01.2018",
          "sayfaSayisi": "256",
          "dil": "Türkçe"
        },
        {
          "id": "kalbin_sirlari_",
          "title": "Kalbin Sırları",
          "author": "İmam Gazali",
          "image": "kalbin_sirlari_.jpg",
          "ozet":
              "“Kalp bir kale gibidir. Şeytan onu ele geçirmek için her an fırsat kollamaktadır. Onun oraya girmesini engellemek için her an uyanık bulunmak, onun giriş yerlerini kapatmak veya oralarda nöbetçi bulundurmak gerekir.",
          "basimYili": "20.01.2022",
          "sayfaSayisi": "120",
          "dil": "Türkçe ",
        },
        {
          "id": "kuranda_karakter_insasi_",
          "title": "Kuranda Karakter İnşası",
          "author": "Yasin Pişkin",
          "image": "kuranda_karakter_insasi_.jpg",
          "ozet":
              "Modern çağda ulvi yönelişini kaybeden insan, tarihte yaşanan cahiliye devirlerini aratacak derecede özünden kopmuş, Yüce Yaratıcı'nın bahşettiği erdemleri elinin tersiyle bir kenara itmiş, süfli hedefleri doğrultusunda inşa ettiği profan dünyada nefsi ve şeytanıyla baş başa kalmış ve böylece dünyayı kendisine zindan etmiştir.",
          "basimYili": "02.10.2020",
          "sayfaSayisi": "432",
          "dil": "Türkçe ",
        },
        {
          "id": "lemalar_",
          "title": "Lemalar",
          "author": "Said Nursi",
          "image": "lemalar_.jpg",
          "ozet": "...",
          "basimYili": "25.03.2013",
          "sayfaSayisi": "531",
          "dil": "Türkçe ",
        },
        {
          "id": "sozler_",
          "title": "Sözler",
          "author": "Said Nursi",
          "image": "sozler_.jpg",
          "ozet": "...",
          "basimYili": "25.03.2013",
          "sayfaSayisi": "736",
          "dil": "Türkçe ",
        },
      ],
      "Korku": [
        {
          "id": "it",
          "title": "It",
          "author": "Stephen King",
          "image": "it.jpg",
          "ozet":
              "Küçük bir Amerikan kasabası olan Derry’yi diğer kasabalardan farklı kılan şey, kanalizasyon mazgallarının altındaki dehlizlerde yaşayan, kendini kimi zaman kâbuslarda, kimi zaman da gerçek hayatta gösteren esrarengiz bir yaratığın varlığıdır.",
          "basimYili": "03.12.2025",
          "sayfaSayisi": "1064",
          "dil": "Türkçe (çeviri)",
        },
        {
          "id": "oyunbaz",
          "title": "Oyunbaz",
          "author": "Wulf Dorn",
          "image": "oyunbaz.jpg",
          "ozet":
              "Hep seni düşünüyorum, yakında sen de beni aklından çıkaramayacaksın…Psikiyatr Jan Forstner bir gün beklenmedik bir anda, kimden geldiği belli olmayan güller alır. ",
          "basimYili": "01.06.2017",
          "sayfaSayisi": "384",
          "dil": "Türkçe (çeviri)",
        },
        {
          "id": "psikiyatrist",
          "title": "Psikiyatrist",
          "author": "Wulf Dorn",
          "image": "psikiyatrist.jpg",
          "ozet":
              "“O GELDİĞİNDE, BENİ KORUYACAĞINA SÖZ VER!” Şiddet mağduru bir kadın hasta, psikiyatrist Ellen Roth’un kâbusu haline gelir: Kara Adam tarafından izlendiğini iddia eden hasta, gizemli biçimde, iz bırakmadan ortadan kaybolur. ",
          "basimYili": "14.04.2017",
          "sayfaSayisi": "416",
          "dil": "Türkçe (çeviri)"
        },
      ],
      "Şiir": [
        {
          "id": "ahlar_agaci",
          "title": "Ahlar Ağacı",
          "author": "Didem Madak",
          "image": "ahlar_agaci.jpg",
          "ozet": "...",
          "basimYili": "15.09.2020",
          "sayfaSayisi": "76",
          "dil": "Türkçe"
        },
        {
          "id": "grapon_kagitlari",
          "title": "Grapon Kağıtları",
          "author": "Didem Madak",
          "image": "grapon_kagitlari.jpg",
          "ozet": "...",
          "basimYili": "08.02.2018",
          "sayfaSayisi": "72",
          "dil": "Türkçe "
        },
        {
          "id": "pulbiber_mahallesi",
          "title": "Pulbiber Mahallesi",
          "author": "Didem Madak",
          "image": "pulbiber_mahallesi.jpg",
          "ozet":
              "Şair Didem Madak son kitabı Pulbiber Mahallesi Metis’ten çıkıyor.",
          "basimYili": "05.03.2024",
          "sayfaSayisi": "116",
          "dil": "Türkçe "
        },
        {
          "id": "erbain_",
          "title": "Erbain",
          "author": "İsmet Özel",
          "image": "erbain_.jpg",
          "ozet":
              "İsmet Özel’in kırk yaşına kadar yayınladığı dört şiir kitabındaki ve bazı dergilerde yer alan şiirleri ERBAİN kitabında toplanmıştır.",
          "basimYili": "01.06.2013",
          "sayfaSayisi": "240",
          "dil": "Türkçe "
        },
        {
          "id": "insanin_acisini_insan_alir",
          "title": "İnsanın Acısını İnsan Alır",
          "author": "Şükrü Erbaş",
          "image": "insanin_acisini_insan_alir.jpg",
          "ozet":
              "“Ayrılık ne biliyor musun? Ne araya yolların girmesi, ne kapanan kapılar, ne yıldız kayması gecede, ne güz, ne ceplerde tren tarifesi, ne de turna katarı gökte... İnsanın içini dökmekten vazgeçmesi ayrılık.",
          "basimYili": "11.10.2019",
          "sayfaSayisi": "256",
          "dil": "Türkçe ",
        },
      ],
      "En Çok Okunanlar": [
        {
          "id": "fareler_ve_insanlar",
          "title": "Fareler ve İnsanlar",
          "author": "John Steinbeck",
          "image": "fareler_ve_insanlar.jpg",
          "ozet":
              "Fareler ve İnsanlar,insan doğasının kadim çıkmazlarına dair usta işi bir John Steinbeck kitabı.Birbirlerine hiç mi hiç benzemeyen iki arkadaşın; ufak tefek ve zeki George ile iriyarı ve aklı kıt Lennie’nin hikâyesini kaleme alıyor Steinbeck.",
          "basimYili": "10.08.2023",
          "sayfaSayisi": "116",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hayat_imkansiz",
          "title": "Hayat İmkansız",
          "author": "Maat Haig",
          "image": "hayat_imkansiz.jpg",
          "ozet": "Harry’nin büyücülük dünyasına ilk adımı...",
          "basimYili": "1997",
          "sayfaSayisi": "274",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "hayvan_ciftligi",
          "title": "Hayvan Çiftliği",
          "author": "George Orwell",
          "image": "hayvan_ciftligi.jpg",
          "ozet":
              "George Orwell’in alegorik romanı Hayvan Çiftliği, totaliter rejimlerin eleştirisini fabl tarzında sunar.",
          "basimYili": "1945",
          "sayfaSayisi": "112",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "icimizdeki_seytan",
          "title": "İçimizdeki Şeytan",
          "author": "Sabahattin Ali",
          "image": "icimizdeki_seytan.jpg",
          "ozet":
              "Sabahattin Ali’nin, yayımlandığı dönemde uzun tartışmalara sebep olan İçimizdeki Şeytan kitabı, milliyetçilik, elitizm, toplumsal cinsiyet gibi kavramların hayata yansımalarını nitelikli bir kurguyla açıklıyor. Karakterlerin vicdan ve akıl arasında sıkıştığı bir anda, “İçimizdeki Şeytan” ortaya çıkıyor. Kitabın ana karakterlerinden Ömer’in yaşanan bütün haksızlıklara, kötülüklere izahı bu ifadede saklıdır. Ömer prototipi üzerinden irade zayıflığını, kararsızlığı, olumsuzluklara hayır diyememeyi, yanlışlıklara direnememeyi ve bunların yol açtığı dramatik sonuçları konu edinen eser, Ali’nin ikinci romanı olma özelliğini taşıyor.",
          "basimYili": "17.01.2019",
          "sayfaSayisi": "300",
          "dil": "Türkçe "
        },
        {
          "id": "kurk_mantolu_madonna",
          "title": "Kürk Mantolu Madonna",
          "author": "Sabahattin Ali",
          "image": "kurk_mantolu_madonna.jpg",
          "ozet":
              "Kürk Mantolu Madonna’da Sabahattin Ali gözlerini çevirmenlik yapan bir memurun yaşamına çevirir. Havran’da doğup büyüyen Raif Efendi sonunda sanat okumaya karar verir ve kasabasından ayrılır. Önce İstanbul’a, oradan Berlin’e kadar uzaklaşır. Kendini bildi bileli düşünceleri dilsizdir; ya konuşmaya değer bulmaz ya da paylaşmaya sevk edecek bir başkasıyla karşılaşmamıştır. Sonunda Berlin’de karşısına çıkan Maria Puder bu sessizliğin bozulmasını sağlar. Raif Efendi yalnızlığından silkinir ve bu tatlı sevdaya bırakır kendini.",
          "basimYili": "13.04.2023",
          "sayfaSayisi": "176",
          "dil": "Türkçe "
        },
        {
          "id": "kuyucakli_yusuf",
          "title": "Kuyucaklı Yusuf",
          "author": "Sabahattin Ali",
          "image": "kuyucakli_yusuf.jpg",
          "ozet":
              "Kuyucaklı Yusuf Türk edebiyatının belki de en romantik kahramanıdır. Hayatın ve insanların zalimliği karşısındaki naif duruşu ile bir yandan trajik bir sona ilerlerken, bir yandan da yaşadığı lirik aşk hikayesinin kahramanı olarak edebiyat tarihinde yerini almıştır.",
          "basimYili": "06.08.2019",
          "sayfaSayisi": "221",
          "dil": "Türkçe "
        },
        {
          "id": "sirca_kosk",
          "title": "Sırça Köşk",
          "author": "Sabahattin Ali",
          "image": "sirca_kosk.jpg",
          "ozet":
              "''Niçin hep acı şeyler yazayım? Dostlar, yufka yürekli dostlar bundan hoşlanmıyorlar. 'Hep kötü, sakat şeyleri mi göreceksin?' diyorlar. 'Hep açlardan, çıplaklardan, dertlilerden mi bahsedeceksin? ",
          "basimYili": "24.09.2021",
          "sayfaSayisi": "141",
          "dil": "Türkçe "
        },
        {
          "id": "martin_eden",
          "title": "Martin Eden",
          "author": "Jack London",
          "image": "martin_eden.jpg",
          "ozet":
              "Jack London’ın, kendi hayatından izler taşıyan romanı Martin Eden, denizci bir gencin kişiliğinden ödün vermeden sınıf atlama çabalarını anlatıyor.",
          "basimYili": "25.04.2019",
          "sayfaSayisi": "496",
          "dil": "Türkçe (çeviri)",
        },
        {
          "id": "seker_portakali",
          "title": "Şeker Portakalı",
          "author": "José Mauro de Vasconcelos",
          "image": "seker_portakali.jpg",
          "ozet":
              "“Ne güzel bir şeker portakalı fidanıymış bu! Hem bak, dikeni de yok. Pek de kişilik sahibiymiş, şeker portakalı olduğu ta uzaktan belli. Ben senin boyunda olsaydım başka şey istemezdim.”",
          "basimYili": "06.09.2019",
          "sayfaSayisi": "184",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "simyaci",
          "title": "Simyacı",
          "author": "Paulo Coelho",
          "image": "simyaci.jpg",
          "ozet":
              "Simyacı, İspanya'dan kalkıp Mısır Piramitlerinin eteklerinde hazinesini aramaya giden Endülüslü çoban Santiago'nun masalsı yaşamının felsefi öyküsü.",
          "basimYili": "28.09.2021",
          "sayfaSayisi": "184",
          "dil": "Türkçe (çeviri)"
        },
        {
          "id": "sineklerin_tanrisi",
          "title": "Sineklerin Tanrısı",
          "author": "William Golding",
          "image": "sineklerin_tanrisi.jpg",
          "ozet":
              "“Sineklerin Tanrısı başlangıçta, ıssız bir adaya düşen çocukların serüvenlerini anlatan, küçükler için yazılmış bir öykü, R.M. Ballantyne’ın Mercan Adası’nın çağdaş bir uygulaması sanılabilir.",
          "basimYili": "25.07.2019",
          "sayfaSayisi": "261",
          "dil": "Türkçe (çeviri)",
        },
        {
          "id": "tutunamayanlar",
          "title": "Tutunamayanlar",
          "author": "Oğuz Atay",
          "image": "tutunamayanlar.jpg",
          "ozet":
              "Türk edebiyatının en önemli eserlerinden biri olan Tutunamayanlar, küçük burjuva dünyasını zekice alaya alır.",
          "basimYili": "1971",
          "sayfaSayisi": "700",
          "dil": "Türkçe",
        },
        {
          "id": "suc_ve_ceza",
          "title": "Suç ve Ceza",
          "author": "Fyodor Dostoyevski",
          "image": "suc_ve_ceza.jpg",
          "ozet":
              " Dostoyevski, insanın karanlık yakasını kendinden sonraki bütün romancıları derinden etkileyecek biçimde dile getirmiş büyük bir 19. yüzyıl ustasıdır.",
          "basimYili": "18.03.2022",
          "sayfaSayisi": "704",
          "dil": "Türkçe (çeviri)",
        },
        {
          "id": "ugultulu_tepeler",
          "title": "Uğultulu Tepeler",
          "author": "Emily Brontë",
          "image": "ugultulu_tepeler.jpg",
          "ozet":
              "Ölümünden bir yıl önce bitirdiği Uğultulu Tepeler’deki karakterlerin yalnızca hayal ürünü kişiler olmadığı, Brontë’nin çevresindeki gerçek kişilerden derin izler taşıdığı da bir gerçektir. Sevgi, kin, nefret, intikam, tutku  gibi güçlü duygularla örülü bu gençlik öyküsü, aynı zamanda marazi bir aşkın hikâyesidir. ",
          "basimYili": "25.09.2019",
          "sayfaSayisi": "408",
          "dil": "Türkçe (çeviri)"
        },
      ],
    };

    final String onsoz = onsozler[category] ?? "";
    final List<Map<String, String>> kitapListesi = kitaplar[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (onsoz.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  onsoz,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            Expanded(
              child: ListView.separated(
                itemCount: kitapListesi.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final kitap = kitapListesi[index];
                  final title = kitap["title"] ?? "";
                  final author = kitap["author"] ?? "";
                  final imagePath =
                      'assets/images/kitaplar/${kitap["image"] ?? "default.jpg"}';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KitapEklePage(
                            kitapId: kitap["id"] ?? "",
                            kitapAdi: kitap["title"] ?? "",
                            yazarAdi: kitap["author"] ?? "",
                            kapak:
                                'assets/images/kitaplar/${kitap["image"] ?? "default.jpg"}',
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                imagePath,
                                width: 50,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    author,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
