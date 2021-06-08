import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bar/UI/components/LineChart.dart';
import 'package:side_bar/utils/bloc.dart';
import 'package:side_bar/utils/constants.dart';
import 'package:side_bar/utils/size_config.dart';

import '../components/appBar.dart';

class DashBoardScreen extends StatefulWidget {
  final Bloc bloc;
  final Tween<double> scale;

  DashBoardScreen({this.bloc, this.scale});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  Duration _duration = Duration(milliseconds: 250);

  bool isScrolled = false;

  AnimationController _sideBarController;
  Animation<double> _sideBarScaleAnimation;

  ScrollController _controller = ScrollController();
  AnimationController _chartAnimationController;
  Animation<double> _chartAnimation;

  @override
  void initState() {
    super.initState();
    _sideBarController = AnimationController(vsync: this, duration: _duration);
    _sideBarScaleAnimation = widget.scale.animate(_sideBarController);

    _chartAnimationController =
        AnimationController(vsync: this, duration: _duration);
    _chartAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_chartAnimationController);
    _controller.addListener(() {
      setState(() {
        if (isScrolled) {
          _chartAnimationController.forward();
        } else {
          _chartAnimationController.reverse();
        }
        isScrolled = _controller.offset > 30;
        // widget.bloc.chartSink.add(isScrolled);
      });
    });
  }

  // Tween<double>(begin: 1, end: 0.7)
  @override
  void dispose() {
    super.dispose();
    _sideBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.bloc.stream,
        initialData: true,
        builder: (context, snapshot) {
          return AnimatedPositioned(
            duration: _duration,
            top: 0,
            bottom: 0,
            left: snapshot.data ? 0 : SizeConfig().width(context) * 0.6,
            right: snapshot.data ? 0 : SizeConfig().width(context) * -0.6,
            child: ScaleTransition(
              scale: _sideBarScaleAnimation,
              alignment: Alignment.center,
              child: Material(
                animationDuration: _duration,
                borderRadius: BorderRadius.circular(30),
                elevation: 10,
                color: Color(0xFF292942),
                child: SafeArea(
                  child: Column(
                    children: [
                      MyAppBar(
                        bloc: widget.bloc,
                        controller: _sideBarController,
                      ),
                      LineChart(chartAnimation: _chartAnimation, duration: _duration, isScrolled: isScrolled, widget: widget),

                      Expanded(
                        child: Container(
                          child: ListView(
                            controller: _controller,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: listItems,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}






