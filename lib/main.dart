import 'package:flutter/material.dart';
import 'package:side_bar/UI/dashboard_screen.dart';
import 'package:side_bar/utils/bloc.dart';

import 'UI/back_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Bloc _bloc = Bloc();

  AnimationController _controller;

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF292942),
      ),
      home: Stack(
        children: [
          BackScreen(
            bloc: _bloc,
            scale: Tween<double>(begin: 0.9, end: 1),
          ),
          DashBoardScreen(
            bloc: _bloc,
            scale: Tween<double>(begin: 1, end: 0.7),
          ),
        ],
      ),
    );
  }
}
