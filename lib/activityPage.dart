import 'package:flutter/material.dart';
import 'package:inst_dupl/user.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.watch<User>();
    return ListView.builder(
        itemCount: user.likedPosts.length,
        itemBuilder: (context, index) {
          return new Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                  child: CircleAvatar(
                    radius: 23.0,
                    backgroundImage:
                        NetworkImage(user.likedPosts[index].avatarImageUri),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                          child: Text(
                        "You",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Flexible(
                        child: Container(
                          child: Text(
                            " liked post of " +
                                user.likedPosts[index].postPublisher,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    child: Align(
                        child: Padding(
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      user.likedPosts[index].contentUri)),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          padding: EdgeInsets.all(15.0),
                        ),
                        alignment: AlignmentDirectional.bottomEnd))
              ]));
        });
  }
}
