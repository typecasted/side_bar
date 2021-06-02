import 'package:flutter/material.dart';
import 'package:side_bar/utils/bloc.dart';
import 'package:side_bar/utils/constants.dart';
import 'package:side_bar/utils/size_config.dart';

class BackScreen extends StatefulWidget {
  final Bloc bloc;
  final Tween<double> scale;

  BackScreen({this.bloc, this.scale});

  @override
  _BackScreenState createState() => _BackScreenState();
}

class _BackScreenState extends State<BackScreen>
    with SingleTickerProviderStateMixin {
  Duration _duration = Duration(milliseconds: 300);

  AnimationController _controller;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scale = widget.scale.animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292942),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig().width(context) * 0.1),
          child: StreamBuilder<bool>(
              stream: widget.bloc.stream,
              initialData: true,
              builder: (context, snapshot) {
                if (snapshot.data) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
                return ScaleTransition(
                  scale: _scale,
                  child: AnimatedOpacity(
                    duration: _duration,
                    opacity: snapshot.data ? 0.0 : 1.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: SizeConfig().height(context) * 0.15,
                          width: SizeConfig().height(context) * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFF3F3F63),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Center(
                            child: Text(
                              'KP',
                              style: textStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      SizeConfig().height(context) * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig().height(context) * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig().width(context) * 0.04,
                              vertical: SizeConfig().height(context) * 0.005),
                          child: Text(
                            'Kunal Pithadiya',
                            style: textStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig().height(context) * 0.03),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig().width(context) * 0.04,
                              vertical: SizeConfig().height(context) * 0.002),
                          child: Text(
                            'ID : 1980-3453-4484',
                            style: textStyle.copyWith(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig().height(context) * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig().height(context) * 0.03,
                        ),
                        BackScreenTile(
                          string: 'DashBoard',
                          highlight: true,
                        ),
                        BackScreenTile(
                          string: 'Messages',
                          highlight: false,
                        ),
                        BackScreenTile(
                          string: 'Utility Bills',
                          highlight: false,
                        ),
                        BackScreenTile(
                          string: 'Fund Transfers',
                          highlight: false,
                        ),
                        BackScreenTile(
                          string: 'Branches',
                          highlight: false,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class BackScreenTile extends StatelessWidget {
  final String string;
  final bool highlight;

  BackScreenTile({this.string, this.highlight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig().width(context) * 0.03,
          vertical: SizeConfig().height(context) * 0.01),
      child: Text(
        string,
        style: textStyle.copyWith(
          fontSize: SizeConfig().height(context) * 0.025,
          fontWeight: FontWeight.w500,
          color: highlight ? Colors.white : Colors.white60,
        ),
      ),
    );
  }
}
