import 'package:flutter/material.dart';
import 'package:sozEbay/feature/dictionary/viewmodel/word_detail.dart';

import 'dictionary_viewmodel.dart';

class WordSearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = GetWordsFromJson().searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestions[index],
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16,
            ),
          ),
          onTap: () {
            query = suggestions[index];
            int ind = 0;
            for (int i = 0; i < GetWordsFromJson().allWords.length; i++) {
              if (GetWordsFromJson().allWords[i][0] == query) {
                ind = i;
              }
            }
            final word = GetWordsFromJson().allWords[ind];
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WordDetail(
                  word: word,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
