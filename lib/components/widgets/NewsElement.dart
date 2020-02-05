import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/News.dart';

class NewsElement extends StatelessWidget {
  final News news;

  ///
  ///
  ///
  NewsElement({Key key, @required this.news}) : super(key: key);

  ///
  ///
  ///
  List<Widget> getText(BuildContext context)
  {
    return [
      Text(news.title, 
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold)
      ),
      SizedBox(height: 15),
      Text(news.description),
      SizedBox(height: 15),
      Text(news.date, 
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.grey, fontSize: 14.0)
      ),
    ];
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: getText(context),
        ),
      ),
      onTap: () => ActionsComposite.launchURL(news.url),
    );
  }
}
