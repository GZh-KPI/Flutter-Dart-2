import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inst_dupl/post/postContent.dart';

import 'likeButton.dart';
import 'likesSign.dart';

class Post extends StatefulWidget {
  final String avatarImageUri;
  final String postPublisher;
  final String contentUri;
  final String likesText;
  final String when;
  final int initialLikesCount;
  final Function postLiked;
  Post(
      {@required this.avatarImageUri,
      @required this.postPublisher,
      @required this.contentUri,
      @required this.likesText,
      @required this.initialLikesCount,
      @required this.when,
      @required this.postLiked});

  @override
  _PostState createState() => _PostState(
      avatarImageUri: this.avatarImageUri, likesCount: this.initialLikesCount);
}

class _PostState extends State<Post> {
  bool isLikeBtnPressed = false;
  bool showContentCoveringHeart = false;
  int likesCount;
  NetworkImage avatarImage;

  _PostState({this.likesCount, String avatarImageUri}) {
    avatarImage = new NetworkImage(avatarImageUri);
  }

  void like(bool toggleContentCoveringHeart) => setState(() {
        widget.postLiked(widget);
        isLikeBtnPressed = !isLikeBtnPressed;
        likesCount = isLikeBtnPressed ? ++likesCount : --likesCount;
        if (toggleContentCoveringHeart) {
          showContentCoveringHeart = true;
          Timer(
              const Duration(milliseconds: 2000),
              () => setState(() {
                    showContentCoveringHeart = false;
                  }));
        }
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: avatarImage),
                    ),
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  new Text(
                    widget.postPublisher,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              new IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: null,
              )
            ],
          ),
        ),
        new PostContent(
            contentUri: widget.contentUri,
            like: like,
            showHeart: showContentCoveringHeart),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new LikeButton(
                      isLikeBtnPressed: isLikeBtnPressed, like: like),
                  new SizedBox(
                    width: 16.0,
                  ),
                  new Icon(
                    FontAwesomeIcons.comment,
                  ),
                  new SizedBox(
                    width: 16.0,
                  ),
                  new Icon(FontAwesomeIcons.paperPlane),
                ],
              ),
              new Icon(FontAwesomeIcons.bookmark)
            ],
          ),
        ),
        new LikesSign(likesCount: likesCount, likesText: widget.likesText),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      new DecorationImage(fit: BoxFit.fill, image: avatarImage),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: new TextField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add a comment...",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(widget.when, style: TextStyle(color: Colors.grey)),
        )
      ],
    );
  }
}
