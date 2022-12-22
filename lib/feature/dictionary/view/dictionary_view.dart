import 'package:flutter/material.dart';
import 'package:sozEBay/product/init/language/locale_keys.g.dart';
import '../viewmodel/dictionary_viewmodel.dart';

import '../viewmodel/search_delegate.dart';
import '../viewmodel/word_detail.dart';

class DictionaryView extends StatefulWidget {
  const DictionaryView({Key? key}) : super(key: key);

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.home_dictionary),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allWords.length,
        itemBuilder: (BuildContext context, int index) {
          final word = allWords[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal,
                backgroundImage: ExactAssetImage(word.url),
              ),
              title: Text(word.lat),
              subtitle: Text(word.tur),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WordDetail(word: word),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
