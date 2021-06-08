import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:side_bar/utils/bloc.dart';
import 'package:side_bar/utils/size_config.dart';


class MyLineChart extends StatefulWidget {

  final Bloc bloc;

  MyLineChart({this.bloc});
  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  final List<Color> gradientColors = [
    const Color(0xff1a61ea),
    // const Color(0xff02d39a),
  ];
  final List<Color> gradientColors2 = [
    const Color(0xff1a61ea),
    const Color(0xff3870d4),
    const Color(0xFF292942),
  ];

  final List<FlSpot> spots1 = [
    FlSpot(0, 3),
    FlSpot(2.6, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 2.5),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
  ];

  final List<FlSpot> spots2 = [
    FlSpot(0, 5),
    FlSpot(1, 5),
    FlSpot(3, 5),
    FlSpot(4, 5),
    FlSpot(6, 5),
    FlSpot(7, 5),
    FlSpot(11, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.bloc.chartStream,
      initialData: true,
      builder: (context, snapshot) {
        return LineChart(
          LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: FlTitlesData(
              show: true,

              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                getTextStyles: (value) => TextStyle(
                  wordSpacing: 10,
                  color: Color(0xff747d86),
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig().height(context) * 0.02,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {

                    case 1:
                      return '   JAN';
                    case 3:
                      return '   MAR';
                    case 5:
                      return '   MAY';
                    case 7:
                      return '   JULY';
                    case 9:
                      return '   SPT';
                    case 10:
                      return ' ';
                  }
                  return ' ';
                },

                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: false,
              ),
            ),
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: false,
            ),
            lineBarsData: [
              LineChartBarData(
                curveSmoothness: 0.4,
                spots: spots1,
                isCurved: true,
                dotData: FlDotData(
                  show: false,
                ),
                colors: gradientColors,
                barWidth: 5,
                // dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  cutOffY: 0.0,
                  // applyCutOffY: true,
                  gradientColorStops: [0.0, 0.5, 1],
                  gradientFrom: Offset(0, 0),
                  gradientTo: Offset(0, 1),
                  show: true,
                  colors: gradientColors2
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
          swapAnimationDuration: Duration(milliseconds: 300),
          swapAnimationCurve: Curves.linear,
        );
      }
    );
  }
}
