import 'package:flutter/material.dart';

import 'activityPage.dart';
import 'feed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

PageController pageController;

class _HomePageState extends State<HomePage> {
  int page = 0;

  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(
        height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: PageView(
          children: [
            Container(
              color: Colors.white,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Flexible(child: Feed())],
              ),
            ),
            Container(color: Colors.white),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Flexible(child: ActivityPage())],
              ),
            ),
            Container(
              color: Colors.white,
            ),
          ],
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.home, color: getPageIconColor(0)),
                  onPressed: () {
                    pageController.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                new IconButton(
                  icon: Icon(Icons.search, color: getPageIconColor(1)),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(Icons.add_box, color: getPageIconColor(2)),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(Icons.favorite, color: getPageIconColor(3)),
                  onPressed: () {
                    pageController.animateToPage(3,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                new IconButton(
                  icon: Icon(Icons.account_box, color: getPageIconColor(4)),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ));
  }

  Color getPageIconColor(int requiredNumber) =>
      page == requiredNumber ? Colors.black : Colors.grey;

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
