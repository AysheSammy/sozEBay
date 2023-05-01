class GetWordsFromJson {
  late final List allWords;


  List<String> searchResults = [];

  List<String> copy_from_allWords_to_saerchResults() {
    for (final k in allWords) {
      searchResults.insert(0, k[0]);
    }
    return searchResults;
  }
}