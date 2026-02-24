import 'dart:convert';
import 'package:flutter/services.dart';

class JsonService {
  Future<Map<String, dynamic>> kitapJsonOku() async {
    final jsonString = await rootBundle.loadString('assets/data/kitaplar.json');
    final Map<String, dynamic> kitaplar = json.decode(jsonString);
    return kitaplar;
  }
}
