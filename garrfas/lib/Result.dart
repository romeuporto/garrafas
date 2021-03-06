import 'package:flutter/material.dart';
import 'PageHome.dart';

class Result extends StatefulWidget {

  int calcTotal;
  Result(this.calcTotal);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blue,
                Colors.lightBlue,
                Colors.blue,
              ]
          ),
        ),
      ),
    );
  }
}
