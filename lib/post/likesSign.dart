import 'package:flutter/material.dart';

class LikesSign extends StatelessWidget {
  final int likesCount;
  final String likesText;

  LikesSign({this.likesCount, this.likesText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        getSign(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  String getSign() =>
      likesText + " and " + (likesCount - 1).toString() + " liked this";
}
