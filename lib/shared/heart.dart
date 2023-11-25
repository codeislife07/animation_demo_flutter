import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorAnimation;

  bool isFav=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this);

    _colorAnimation=ColorTween(begin: Colors.grey,end: Colors.red)
      .animate(_animationController);

     // _animationController.forward();

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });

    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        isFav=true;
      }else{
        isFav=false;
      }
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            isFav?_animationController.reverse():_animationController.forward();
          },
        );
      },
    );
  }
}
