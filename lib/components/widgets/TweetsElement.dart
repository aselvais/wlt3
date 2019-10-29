import 'package:flutter/material.dart';
import 'package:wlt3/models/Tweet.dart';

class TweetsElement extends StatelessWidget {
  final Tweet tweet;

  TweetsElement({Key key, @required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        // height: 100,
        color: Colors.yellow,
        child: Text(
          tweet.date + "\n" +
          tweet.text
        ),
      ),
      onTap: () => print('Clicked'),
    );
  }
}
