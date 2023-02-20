import 'dart:convert';
import 'package:flutter/services.dart';

late final List<Word> allWords;
List<Word> wordsFromJson(String str) =>
    List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));


Future<List<Word>> readJson() async {
  var response = await rootBundle.loadString("assets/words/words.json");

  if (response.isNotEmpty) {
    allWords = wordsFromJson(response);
    return allWords;
  } else {
    return [];
  }
}

List<String> searchResults = [];

List<String> copy_from_allWords_to_saerchResults() {
  for (final k in allWords) {
    searchResults.insert(0, k.lat);
  }

  return searchResults;
}

class Word {
  final String lat;
  final String tur;
  final String url;

  const Word({
    required this.lat,
    required this.tur,
    required this.url,
  });

  factory Word.fromJson(Map<String, dynamic> json) =>
      Word(lat: json["lat"], tur: json["tur"], url: json["url"]);
}
