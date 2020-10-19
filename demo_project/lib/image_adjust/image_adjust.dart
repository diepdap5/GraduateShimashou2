import 'package:flutter/material.dart';

class MyApp_Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Image Tutorial'),
        ),
        body: Center(
            child: Container(
                child: Image.asset(
          'assets/image/KannaWhat.png',
          height: 500,
          width: 500, // choose scale or height_width
          color: Colors.red[200],
          // colorBlendMode: BlendMode.darken,
          fit: BoxFit.fitWidth,

          // scale: 0.1,
        ))),
      ),
    );
  }
}
