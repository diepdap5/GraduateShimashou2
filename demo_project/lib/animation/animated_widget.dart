import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 500).animate(controller)
      // ..addStatusListener((state) => print('$state'));
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((state) => print('$state'));
    // ..addListener(() {
    //   setState(() {
    //     // The state that has changed here is the animation object’s value.
    //   });
    // });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);
  //   return Center(
  //     child: Container(
  //       margin: EdgeInsets.symmetric(vertical: 10),
  //       height: animation.value,
  //       width: animation.value,
  //       child: FlutterLogo(),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
