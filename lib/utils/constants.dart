

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bar/utils/size_config.dart';

TextStyle textStyle = TextStyle(
  color: Colors.white,
);

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig().width(context) * 0.04, vertical: SizeConfig().height(context) * 0.01),
      child: Container(
        height: SizeConfig().height(context) * 0.1,
        width: SizeConfig().width(context) * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFF3D3D63),

          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

List<ListItem> listItems = [
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
  ListItem(),
];