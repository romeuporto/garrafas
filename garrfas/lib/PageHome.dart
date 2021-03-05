import 'package:flutter/material.dart';
import 'package:garrfas/Result.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  TextEditingController _calcLitros = TextEditingController();
  TextEditingController _calcQuant = TextEditingController();


  void exibirResult() {
    var result = "";
    print("Digitado " + _calcQuant.text);
    bottleList = result.split(",").cast<double>();
    bottleList.sort((a, b) => b.compareTo(a));
  }

  List<double> bottleList = [];
  var resposta = "";

  void listFull (){

    double galaoVazio;
    double garrafasCheias;

    for (int i = 0; i <= bottleList.length; i++) {
      print("Executar $bottleList");

      if(double.tryParse(_calcQuant.text) - double.tryParse(_calcLitros.text) >= 0){
        bottleList.add(garrafasCheias);
        galaoVazio = galaoVazio - garrafasCheias;
      }else{
        // não fez sentido fazer verificação pois a lista esta ordenada
        galaoVazio = garrafasCheias;
      }
      // se sobrou algo, usar galaoVazio, se não sobrou descartar ela
      if(galaoVazio != 0){
        bottleList.add(galaoVazio);
      }else{
        galaoVazio = 0;
      }
      resposta = "Resposta: $bottleList, sobre ${galaoVazio - garrafasCheias}L.";
    }
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
              controller: _calcLitros,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.white
                  ),
                ),
                hintText: "Litros ex.: 1,5",
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
              controller: _calcQuant,
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
                      exibirResult();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contexte) => Result()
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
