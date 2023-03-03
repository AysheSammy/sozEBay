import 'package:flutter/material.dart';
import 'package:sozEBay/feature/dictionary/viewmodel/word_detail.dart';

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
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return FutureBuilder(
        future: readJson(),
        builder: (_, AsyncSnapshot<List<Word>> allWords) {
          if (allWords.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = allWords.data![index].lat;
              return ListTile(
                title: Text(
                  suggestion,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  query = suggestion;
                  final word = allWords.data![index];
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
        });
  }
}
