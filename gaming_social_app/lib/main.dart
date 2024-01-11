import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/mynavigation.dart';
import 'package:gaming_social_app/ui/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => MyNavigation(),
        child: MyApp(),
      ),
    );
Future getUser(String id) async {
  final response =
      await http.post(Uri.http('http://192.168.1.102', '/users/ids'),
          body: jsonEncode(
            {'id': '$id'},
          ),
          headers: {'Content-Type': 'application/json'});
  print(response.body);
}

class MyApp extends StatelessWidget {
  final List<Widget> _pages = [HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'OpenSans'),
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Consumer<MyNavigation>(
                builder: (context, navigation, _) {
                  return _pages[navigation.currentIndex];
                },
              ),
              Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                height: 59,
                child: Row(
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: greenColor,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 21.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Provider.of<MyNavigation>(context,
                                        listen: false)
                                    .goHome();
                              },
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onTap: () {},
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              onTap: () {},
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
