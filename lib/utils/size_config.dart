import 'package:flutter/cupertino.dart';

class SizeConfig {
  height(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height;
  }

  width(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width;
  }
}
