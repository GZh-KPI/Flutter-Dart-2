import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:inst_dupl/post/post.dart';

class User extends ChangeNotifier {
  final List<Post> _likedPosts = new List<Post>();

  UnmodifiableListView<Post> get likedPosts =>
      UnmodifiableListView(_likedPosts);

  void postLiked(Post post) {
    _likedPosts.contains(post)
        ? _likedPosts.remove(post)
        : _likedPosts.add(post);

    notifyListeners();
  }
}
