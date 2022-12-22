import 'package:flutter/material.dart';
import 'package:sozEBay/feature/dictionary/viewmodel/word_detail.dart';

import 'dictionary_viewmodel.dart';

class MySearchDelegate extends SearchDelegate {
  // [ 'frontalis','occipitalis','ethmoidalis'];
//const MySearchDelegate({Key ? key, required this.w}) : (super (key:key));
  @override
  Widget ? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, null);
    },
  );

  @override
  List<Widget> ? buildActions(BuildContext context) => [IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
      if(query.isEmpty){
        close(context, null);
      }else{query = '';}
    },
  )];

  Widget buildResults(BuildContext context) => Center(
    child: Text(query),
  );

  @override
  Widget buildSuggestions(BuildContext context){

    List<String> suggestions = searchResults.where((searchResult){
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){

        final suggestion = allWords[index].lat;
        return ListTile(
          title: Text(suggestion),
          onTap: (){
            query = suggestion;
            final word = allWords[index];
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WordDetail(word: word,),
            ),);
          },
        );
      },
    );
  }
}