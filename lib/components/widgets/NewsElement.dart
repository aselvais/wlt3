import 'package:flutter/material.dart';
import 'package:wlt3/models/News.dart';

class NewsElement extends StatelessWidget {
  final News news;

  NewsElement({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        // height: 100,
        color: Colors.yellow,
        child: Text(
          news.title + "\n" +
          news.date + "\n" +
          news.description + "\n" +
          news.url
        ),
      ),
      onTap: () => print('Clicked'),
    );
  }
}
