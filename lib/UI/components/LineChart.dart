
import 'package:flutter/material.dart';
import 'package:side_bar/UI/Screens/chart_screen.dart';
import 'package:side_bar/UI/Screens/dashboard_screen.dart';
import 'package:side_bar/utils/size_config.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    Key key,
    @required Animation<double> chartAnimation,
    @required Duration duration,
    @required this.isScrolled,
    @required this.widget,
  }) : _chartAnimation = chartAnimation, _duration = duration, super(key: key);

  final Animation<double> _chartAnimation;
  final Duration _duration;
  final bool isScrolled;
  final DashBoardScreen widget;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _chartAnimation,
      child: AnimatedContainer(
        duration: _duration,
        curve: Curves.linear,
        alignment: Alignment.topCenter,

        height: isScrolled ? 0 : SizeConfig().height(context) * 0.25,
        width: double.infinity,

        decoration: BoxDecoration(
          // color: Color(0xFF1F2031),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        // color: Colors.red,
        child: isScrolled
            ? Container()
            : MyLineChart(
          bloc: widget.bloc,
        ),
      ),
    );
  }
}