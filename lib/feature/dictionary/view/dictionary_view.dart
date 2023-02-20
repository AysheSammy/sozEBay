import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sozEBay/product/init/language/locale_keys.g.dart';
import '../viewmodel/dictionary_viewmodel.dart';

import '../viewmodel/search_delegate.dart';
import '../viewmodel/word_detail.dart';
import 'package:kartal/kartal.dart';

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
        title: Text(LocaleKeys.home_dictionary.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: WordSearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: readJson(),
            builder: (_, AsyncSnapshot allWords) {
              if (allWords.connectionState == ConnectionState.waiting) {
                debugPrint(allWords.toString());
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: allWords.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final word = allWords.data?[index] ?? [];
                  debugPrint(word.toString());
                  if (word != []) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal,
                          backgroundImage: ExactAssetImage(word.url),
                        ),
                        title: Text(
                          word.lat.toString().toCapitalized(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        subtitle: Text(
                          word.tur.toString().toCapitalized(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WordDetail(word: word),
                          ));
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        LocaleKeys.info_notFound.tr(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}
