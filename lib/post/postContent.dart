import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/widgets.dart';

class PostContent extends StatelessWidget {
  final String contentUri;
  final Function like;
  final bool showHeart;

  PostContent(
      {@required this.contentUri,
      @required this.like,
      @required this.showHeart});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        child: GestureDetector(
            onDoubleTap: () {
              like(true);
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Image.network(
                  contentUri,
                  fit: BoxFit.cover,
                ),
                showHeart
                    ? Positioned(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Opacity(
                              opacity: 0.85,
                              child: FlareActor(
                                "assets/flare/Like.flr",
                                animation: "Like",
                              )),
                        ),
                      )
                    : Container()
              ],
            )));
  }
}
