import 'package:flutter/material.dart';
import 'package:garrfas/Result.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  TextEditingController _liters = TextEditingController();
  TextEditingController _galao = TextEditingController();

  List<String> allList;




  void result() {
    allList = _liters.text.split(",");
    allList.sort((a, b) => b.compareTo(a));
    print(allList);

    // allList = _liters.text.split(",").cast<double>();
    // allList.sort((a, b) => b.compareTo(a));
  }



  String calcTotal() {
      var galao = double.parse(_galao.text);
      var garrafaSobra;
      List<double> garrafasUsadas = [];

      for (var garrafas in allList) {
        var garrafaAtual = double.parse(garrafas);
        print(garrafaAtual);
        if (galao - garrafaAtual >= 0) {
          garrafasUsadas.add(garrafaAtual);
          galao = galao - garrafaAtual;
        }else{
          garrafaSobra = garrafaAtual;
        }
      }
      if(galao != 0){
        garrafasUsadas.add(garrafaSobra);
      }else{
        garrafaSobra = 0;
      }
      return "Resposta: $garrafasUsadas; sobra ${garrafaSobra - galao}L.";
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
        child: Column(
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
                hintText: "Quatidade de Galão",
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
                      var resultFinal = calcTotal();
                      print(resultFinal);
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Result(resultFinal),
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
