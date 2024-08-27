import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String digit;
  final Function OnClick;
  const CalculatorButton({super.key,required this.digit , required this.OnClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: (){
                OnClick(digit);
            },
              child: Text( digit , style: const TextStyle(fontSize: 24),),
          ),
        )
    );
  }
}
