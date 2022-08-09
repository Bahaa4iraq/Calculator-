import 'package:flutter/material.dart';

import 'colors.dart';

class ButtonText extends StatefulWidget {
  const ButtonText({Key? key, required this.txt}) : super(key: key);
  final String txt;

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  List operator = ["+", "-", "*", "/", "AC", "C", "=", "+/-"];

  bool checkType(String symbol) {
    if (operator.contains(symbol)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white70),
          gradient: LinearGradient(
            colors: [
              CalculatorColor.backround,
              checkType(widget.txt)
                  ? CalculatorColor.secondary
                  : CalculatorColor.primary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Text(
        widget.txt,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white70,
        ),
      ),
    );
  }
}
