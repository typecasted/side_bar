import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bar/utils/bloc.dart';
import 'package:side_bar/utils/constants.dart';
import 'package:side_bar/utils/size_config.dart';

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

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  bool isCollapsed = true;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = widget.scale.animate(_controller);
  }
  // Tween<double>(begin: 1, end: 0.7)
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
          // top: snapshot.data ? 0 : SizeConfig().height(context) * 0.2,
          // bottom: snapshot.data ? 0 : SizeConfig().height(context) * 0.2,
          left: snapshot.data ? 0 : SizeConfig().width(context) * 0.6,
          right: snapshot.data ? 0 : SizeConfig().width(context) * -0.6,
          child: ScaleTransition(
            scale: _scaleAnimation,
            alignment: Alignment.center,
            child: Material(
              animationDuration: _duration,
              borderRadius: BorderRadius.circular(30),
              elevation: 10,
              color: Color(0xFF292942),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig().height(context) * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(isCollapsed){
                                setState(() {
                                  isCollapsed = false;
                                  _controller.forward();
                                });
                              }
                              else{
                                setState(() {
                                  isCollapsed = true;
                                  _controller.reverse();
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
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
