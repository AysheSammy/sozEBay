import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sozEbay/product/init/language/locale_keys.g.dart';
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
  List words = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/words/notification.json");

    if (response.isNotEmpty) {
      final data = await json.decode(response);
      GetWordsFromJson().allWords = data["items"];
      setState(() {
        words = data["items"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                words.length,
                (index) => Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal,
                          backgroundImage: ExactAssetImage(words[index][2]),
                        ),
                        title: Text(
                          words[index][0].toString().toCapitalized(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        subtitle: Text(
                          words[index][1].toString().toCapitalized(),
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
                            builder: (context) => WordDetail(word: words[index]),
                          ));
                        },
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
