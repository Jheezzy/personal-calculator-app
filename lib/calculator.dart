import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //LOGIC
  int firstNumber = 0;
  int secondNumber = 0;
  String result = '';
  String text = '';
  String operation = '';

  void calculate(buttonText) {
    if (buttonText == 'AC') {
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      text = '';
      operation = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      firstNumber = int.parse(text);
      result = '';
      operation = buttonText;
    } else if (buttonText == '=') {
      secondNumber = int.parse(text);
      switch (operation) {
        case '+':
          result = (firstNumber + secondNumber).toString();
          break;
        case '-':
          result = (firstNumber - secondNumber).toString();
          break;
        case 'x':
          result = (firstNumber * secondNumber).toString();
          break;
        case '/':
          result = (firstNumber / secondNumber).toString();
          break;
        default:
          break;
      }
    } else {
      result = int.parse(text + buttonText).toString();
    }
    setState(() {
      text = result;
    });
  }

  Widget buttons(String btnText, Color btnColor, Color textColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
        // padding: EdgeInsets.all(20)
      ),
      onPressed: () => calculate(btnText),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,
                    // textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('AC', Colors.grey, Colors.black),
                buttons('+/-', Colors.grey, Colors.black),
                buttons('%', Colors.grey, Colors.black),
                buttons('/', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('7', Colors.grey[850]!, Colors.white),
                buttons('8', Colors.grey[850]!, Colors.white),
                buttons('9', Colors.grey[850]!, Colors.white),
                buttons('x', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('4', Colors.grey[850]!, Colors.white),
                buttons('5', Colors.grey[850]!, Colors.white),
                buttons('6', Colors.grey[850]!, Colors.white),
                buttons('-', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('1', Colors.grey[850]!, Colors.white),
                buttons('2', Colors.grey[850]!, Colors.white),
                buttons('3', Colors.grey[850]!, Colors.white),
                buttons('+', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.grey[850]!),
                  onPressed: () => calculate,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 90, 12),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                buttons('.', Colors.grey[850]!, Colors.white),
                buttons('=', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
