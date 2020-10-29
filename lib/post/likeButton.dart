import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatelessWidget {
  final bool isLikeBtnPressed;
  final Function like;

  const LikeButton({this.isLikeBtnPressed, this.like});

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon:
          new Icon(isLikeBtnPressed ? Icons.favorite : FontAwesomeIcons.heart),
      color: isLikeBtnPressed ? Colors.red : Colors.black,
      onPressed: () {
        like(false);
      },
    );
  }
}
