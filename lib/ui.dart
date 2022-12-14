import 'dart:math';

import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'buttonClass.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isSci = false;
String equation = "0";
String result = "0";
String expression = "";

class _MyHomePageState extends State<MyHomePage> {
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "C") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "+/-") {
        try {
          var num1 = double.parse(equation);
          num1 = num1 * (-1);
          result = "$num1";
          equation = "$num1";
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "sin") {
        var equation1 = double.parse(equation);
        equation1 = equation1 * pi / 180;
        equation = "sin($equation1)";
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "cos") {
        var equation1 = double.parse(equation);
        equation1 = equation1 * pi / 180;
        equation = "cos($equation1)";
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "sqr") {
        equation = "$equation * $equation";

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "%") {
        equation = "$equation/100";
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "sqrt") {
        equation = "sqrt($equation)";
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = "";
        }
        equation = equation + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CalculatorColor.backround2,
      body: Column(
        children: [
          Stack(children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: CalculatorColor.backround,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      //fontFamily: "digital",
                      color: CalculatorColor.backround2,
                      fontSize: 50,
                    ),
                  ),
                  Divider(
                    color: CalculatorColor.backround2,
                    thickness: 2,
                  ),
                  Text(
                    equation,
                    style: TextStyle(
                      //fontFamily: "digital",
                      color: CalculatorColor.backround2,
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            ),
            Switch(
                inactiveTrackColor: CalculatorColor.secondary,
                value: isSci,
                onChanged: (_) => setState(() {
                      isSci = !isSci;
                    }))
          ]),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: CalculatorColor.backround,
              ),
              child: Column(children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () => buttonPressed("AC"),
                            child: const ButtonText(txt: "AC")),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () => buttonPressed("C"),
                            child: const ButtonText(txt: "C")),
                      ),
                      Expanded(
                        child: isSci
                            ? InkWell(
                                onTap: () => buttonPressed("sqrt"),
                                child: const ButtonText(txt: "sqrt"))
                            : InkWell(
                                onTap: () => buttonPressed("+/-"),
                                child: const ButtonText(txt: "+/-")),
                      ),
                      Expanded(
                        child: isSci
                            ? InkWell(
                                onTap: () => buttonPressed("%"),
                                child: const ButtonText(txt: "%"),
                              )
                            : InkWell(
                                onTap: () => buttonPressed("/"),
                                child: const ButtonText(txt: "/"),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("1"),
                          child: const ButtonText(txt: "1"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("2"),
                          child: const ButtonText(txt: "2"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("3"),
                          child: const ButtonText(txt: "3"),
                        ),
                      ),
                      Expanded(
                        child: isSci
                            ? InkWell(
                                onTap: () => buttonPressed("sin"),
                                child: const ButtonText(txt: "sin"),
                              )
                            : InkWell(
                                onTap: () => buttonPressed("*"),
                                child: const ButtonText(txt: "*"),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("4"),
                          child: const ButtonText(txt: "4"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("5"),
                          child: const ButtonText(txt: "5"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("6"),
                          child: const ButtonText(txt: "6"),
                        ),
                      ),
                      Expanded(
                        child: isSci
                            ? InkWell(
                                onTap: () => buttonPressed("cos"),
                                child: const ButtonText(txt: "cos"),
                              )
                            : InkWell(
                                onTap: () => buttonPressed("-"),
                                child: const ButtonText(txt: "-"),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("7"),
                          child: const ButtonText(txt: "7"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("8"),
                          child: const ButtonText(txt: "8"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("9"),
                          child: const ButtonText(txt: "9"),
                        ),
                      ),
                      Expanded(
                        child: isSci
                            ? InkWell(
                                onTap: () => buttonPressed("sqr"),
                                child: const ButtonText(txt: "sqr"),
                              )
                            : InkWell(
                                onTap: () => buttonPressed("+"),
                                child: const ButtonText(txt: "+"),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("0"),
                          child: const ButtonText(txt: "0"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("00"),
                          child: const ButtonText(txt: "00"),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("."),
                          child: const ButtonText(txt: "."),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => buttonPressed("="),
                          child: const ButtonText(txt: "="),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
