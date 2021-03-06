import 'package:flutter/material.dart';
import 'package:garrfas/Result.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  TextEditingController _liters = TextEditingController();
  TextEditingController _galao = TextEditingController();

  List<double> allList;

  void result() {
    var list = "";
    allList = list.split(",").cast<double>();
    allList.sort((a, b) => b.compareTo(a));
    print("Digitado: " +_galao.text + _liters.text);
  }

  String calcTotal(List<double> allList) {

    var galao = _galao as double;
      var resultFinal;
      var garrafaSobra;
      List<double> garrafasUsadas = [];

      for (var garrafas in allList) {
        if (garrafas - galao >= 0) {
          allList.add(garrafas);
          galao = galao - garrafas;
        }else{
          garrafaSobra = garrafas;
        }
      }
      if(galao != 0){
        garrafasUsadas.add(garrafaSobra);
      }else{
        garrafaSobra = 0;
      }
      resultFinal = "Resposta: $garrafasUsadas; sobra ${garrafaSobra - galao}L.";
      return resultFinal;
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 150,
          right: 40,
          left: 40,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.lightBlue,
                Colors.blue,
                Colors.lightBlue,
              ]
          ),
        ),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _liters,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.white
                  ),
                ),
                hintText: "Litros ex.: 1.5",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _galao,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.white
                  ),
                ),
                hintText: "Quatidade de Garrafas",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20)
                  )
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Cálcular",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  onPressed: (){
                      result();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result()
                        )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
