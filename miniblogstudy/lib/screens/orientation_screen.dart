import 'package:flutter/material.dart';
import 'package:miniblogstudy/screens/home_page.dart';

class OrientationScreen extends StatelessWidget {
  const OrientationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        print("İf");
        return Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.green,
              child: Homepage(),
            ),
          ),
        );
      } else {
        print("else");

        return Scaffold(
          backgroundColor: Colors.yellow,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.green,
              child: Homepage(),
            ),
          ),
        );
      }
    });
  }
}
