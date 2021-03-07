import 'package:flutter/material.dart';
import 'PageHome.dart';

class Result extends StatefulWidget {


  String calcTotal;
  Result(this.calcTotal);



  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Resultado Final",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
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
        child: Center(
          child: Text(
            widget.calcTotal,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
