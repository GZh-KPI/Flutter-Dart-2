import 'package:flutter/material.dart';
import 'package:inst_dupl/post/post.dart';
import 'package:inst_dupl/storiesBar.dart';
import 'package:inst_dupl/user.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var user = Provider.of<User>(context, listen: false);
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? new SizedBox(
                child: new StoriesBar(),
                height: deviceSize.height * 0.15,
              )
            : new Post(
                avatarImageUri:
                    "https://images.pexels.com/photos/4681107/pexels-photo-4681107.jpeg",
                contentUri:
                    "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg",
                postPublisher: "doggy",
                likesText: "your_friend",
                initialLikesCount: 10,
                when: "1 day ago",
                postLiked: user.postLiked);
      },
    );
  }
}
