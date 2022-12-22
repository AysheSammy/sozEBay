final List<Word> allWords = [
  const Word(
    lat: 'os frontalis  ',
    tur: 'manlay sunki',
    url: 'images/frontalis.png',
  ),
  const Word(
    lat: 'os occipitalis  ',
    tur: 'yense sunki',
    url: 'images/occipitalis.png',
  ),
  const Word(
    lat: 'os ethmaidalis',
    tur: 'gozenekli sunk',
    url: 'images/ethmoidalis.png',
  ),
  const Word(
    lat: 'os frontalis  ',
    tur: 'manlay sunki',
    url: 'images/frontalis.png',
  ),
  const Word(
    lat: 'os occipitalis  ',
    tur: 'yense sunki',
    url: 'images/occipitalis.png',
  ),
  const Word(
    lat: 'os ethmaidalis  ',
    tur: 'gozenekli sunk',
    url: 'lib/assets/images/ethmoidalis.png',
  ),
  const Word(
    lat: 'os frontalis  ',
    tur: 'manlay sunki',
    url: 'images/frontalis.png',
  ),
  const Word(
    lat: 'os occipitalis',
    tur: 'yense sunki',
    url: 'images/occipitalis.png',
  ),
  const Word(
    lat: 'os ethmaidalis  ',
    tur: 'gozenekli sunk',
    url: 'images/ethmoidalis.png',
  ),
  const Word(
    lat: 'os frontalis  ',
    tur: 'manlay sunki',
    url: 'images/frontalis.png',
  ),
  const Word(
    lat: 'os occipitalis  ',
    tur: 'yense sunki',
    url: 'images/occipitalis.png',
  ),
  const Word(
    lat: 'os ethmaidalis  ',
    tur: 'gozenekli sunk',
    url: 'images/ethmoidalis.png',
  ),
];

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
}
