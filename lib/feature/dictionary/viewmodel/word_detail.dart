import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'dictionary_viewmodel.dart';

class WordDetail extends StatelessWidget {
  final Word word;

  const WordDetail({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(word.lat.toTitleCase()),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: <Widget>[
                InteractiveViewer(
                  panEnabled: false,
                  // Set it to false
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset(
                    word.url,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  word.lat.toUpperCase(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width / 4,
                  endIndent: MediaQuery.of(context).size.width / 4,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.error,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    word.tur.toCapitalized(),
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
