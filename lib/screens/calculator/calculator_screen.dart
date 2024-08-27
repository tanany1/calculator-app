import 'package:calculator_app/screens/calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});
  static const String route="calculator screen";
  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State{
  String result="";
  String lhs="";
  String savedOperator="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator App"),
        ),
        backgroundColor: Colors.blueAccent,
        body:  Column(
          children: [
            Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Text( result , style: TextStyle(fontSize: 32,color: Colors.white),)),
                      SizedBox(width: 8,)
                    ],
                  ),
                )
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(digit: "7" ,OnClick: onDigitClick,),
                  CalculatorButton(digit: "8",OnClick: onDigitClick,),
                  CalculatorButton(digit: "9",OnClick: onDigitClick,),
                  CalculatorButton(digit: "+",OnClick: onOperatorClick,),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(digit: "4",OnClick: onDigitClick),
                  CalculatorButton(digit: "5",OnClick: onDigitClick),
                  CalculatorButton(digit: "6",OnClick: onDigitClick),
                  CalculatorButton(digit: "-",OnClick: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(digit: "1",OnClick: onDigitClick),
                  CalculatorButton(digit: "2",OnClick: onDigitClick),
                  CalculatorButton(digit: "3",OnClick: onDigitClick),
                  CalculatorButton(digit: "*",OnClick: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(digit: ".",OnClick: onDigitClick),
                  CalculatorButton(digit: "0",OnClick: onDigitClick),
                  CalculatorButton(digit: "=",OnClick: onEqualClick),
                  CalculatorButton(digit: "/",OnClick: onOperatorClick),
                ],
              ),
            ),
          ],
        )
    );
  }

  void onDigitClick(String digit){
    result +=digit ;
    setState(() {});
  }

  void onOperatorClick (String operator){
    if(savedOperator.isEmpty){
      lhs=result;
      savedOperator = operator;
    }else{
      lhs = calc(lhs, savedOperator, result);
      savedOperator = operator;
    }
    result="";
    setState(() {});
  }

  void onEqualClick(_){
    result = calc(lhs, savedOperator, result);
    lhs="";
    savedOperator="";
    setState(() {});
  }

  String calc(String lhs,String operator, String rhs){
    double n1=double.parse(lhs);
    double n2= double.parse(rhs);
    if(operator=="+"){
      return "${n1 + n2}";
    }else if (operator=="-") {
      return "${n1 - n2}";
    }else if (operator=="*") {
      return "${n1 * n2}";
    }else{
      return "${n1 / n2}";
    }
  }
}