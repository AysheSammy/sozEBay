import 'package:flutter/material.dart';
import 'dictionary_viewmodel.dart';

class WordDetail extends StatelessWidget {
  final Word word;

  const WordDetail({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(word.lat),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                word.url,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                word.lat,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text('______________'),
              Text(
                word.tur,
                style:
                    const TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      );
}
