import 'package:flutter/material.dart';
import 'package:inst_dupl/homePage.dart';
import 'package:inst_dupl/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final User user = new User();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(create: (context) => user),
        ],
        child: MaterialApp(
          title: 'Instagram',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.black,
              buttonColor: Colors.black,
              primaryIconTheme: IconThemeData(color: Colors.black),
              primaryTextTheme: TextTheme(
                  bodyText1:
                      TextStyle(color: Colors.black, fontFamily: "Aveny")),
              textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
          home: new HomePage(),
        ));
  }
}
