import 'package:flutter/material.dart';

class MyApp_Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Welcome to Flutter';
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
              child: Container(
                  //         child: Image.asset(
                  //   'assets/image/KannaWhat.png',
                  //   height: 500,
                  //   width: 500, // choose scale or height_width
                  //   color: Colors.red[200],
                  //   // colorBlendMode: BlendMode.darken,
                  //   fit: BoxFit.fitWidth,

                  //   // scale: 0.1,
                  // ))),
                  child: Image.network(
            'https://picsum.photos/250?image=9',
          )))),
    );
  }
}
