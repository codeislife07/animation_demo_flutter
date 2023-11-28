import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> curve;

  bool isFav=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: this);

    curve=CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    //now we use curve because _animationcontroller its parent
    _colorAnimation=ColorTween(begin: Colors.grey,end: Colors.red)
        .animate(curve);

    _sizeAnimation=TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem(tween: Tween(begin: 30,end: 50),
              weight: 50),
          TweenSequenceItem(tween: Tween(begin: 50,end: 30),
              weight: 50),
        ]
    ).animate(curve);

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
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isFav?_animationController.reverse():_animationController.forward();
          },
        );
      },
    );
  }
}