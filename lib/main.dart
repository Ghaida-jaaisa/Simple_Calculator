import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String _title = "Flutter App" ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Calculator") , centerTitle: true,),
        body: MyWidget(),
      ),
    );
  }
}

//
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
// variables
  List<double> numbers = [1,2,3,4,5];
  List<String> oper = ["+", "-", "*", "/"];
  double valChoose1 = 1;
  double valChoose2 = 1;
  String operChoose = "+" ;
  double result = 2.0 ;


// method

  double add() {
    return valChoose1 + valChoose2  ;
  }
  double sub (){
    return valChoose1 -  valChoose2  ;
  }
  double mul() {
    return valChoose1 * valChoose2  ;
  }
  double div() {
    return valChoose1 / valChoose2  ;
  }

  void setResult() {
    if (operChoose == '+') {
      result = add();
      print(result);
    }
    else if (operChoose == '-') {
      result = sub();
    }
    else if (operChoose == '*') {
      result = mul();
    }
    else if (operChoose == '/') {
      result = div();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                  value: valChoose1,
                  items: numbers.map((num) {
                    return DropdownMenuItem(
                        value:  num,
                        child: Text("${num}"));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      valChoose1 = val as double ;
                      setResult();
                    });
                  }
              ) ,
              DropdownButton(
                  value: operChoose,
                  items: oper.map((oper) {
                    return DropdownMenuItem(
                        value:  oper,
                        child: Text("${oper}"));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      operChoose = val as String ;
                      setResult();
                    });
                  }
              ) ,
              DropdownButton(
                  value: valChoose2,
                  items: numbers.map((num) {
                    return DropdownMenuItem(
                        value:  num,
                        child: Text("${num}"));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      valChoose2 = val as double ;
                      setResult();
                    });
                  }
              ) ,
            ],
          ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Equals" , style: TextStyle(fontSize: 22.0 , color: Colors.green),)
            ],
          ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${result}" , style: TextStyle(fontSize: 20.0),)
            ],
          )
        ],
      ),
    );
  }
}