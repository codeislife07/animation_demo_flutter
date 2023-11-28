import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //in side built in animation
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0,end: 1),
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(top: value*20),
            child: child!,
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}