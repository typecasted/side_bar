
import 'package:flutter/material.dart';
import 'package:side_bar/utils/bloc.dart';
import 'package:side_bar/utils/constants.dart';
import 'package:side_bar/utils/size_config.dart';

class MyAppBar extends StatefulWidget {
  final Bloc bloc;
  final AnimationController controller;

  MyAppBar({this.bloc, this.controller});

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig().height(context) * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (isCollapsed) {
                setState(() {
                  isCollapsed = false;
                  widget.controller.forward();
                });
              } else {
                setState(() {
                  isCollapsed = true;
                  widget.controller.reverse();
                });
              }

              widget.bloc.sink.add(isCollapsed);
            },
            child: Icon(
              Icons.menu,
              size: SizeConfig().height(context) * 0.035,
              color: Colors.white,
            ),
          ),
          Text(
            'Dashboard',
            style: textStyle.copyWith(
              fontSize: SizeConfig().height(context) * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}