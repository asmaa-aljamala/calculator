import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String equal = "0";
  String result = "";
  String textShow = "";
  String operation = "";
  String prev = "";
  int firstNum = 0;
  int secondNum = 0;

  void onClick(String buttonText) {
    if (buttonText == 'C') {
      textShow = "";
      firstNum = 0;
      secondNum = 0;
      result = "";
      prev = "";
    } else if (buttonText == '⌫') {
      result = textShow.substring(0, textShow.length - 1);
    } else if (buttonText == '+' ||
        buttonText == '÷' ||
        buttonText == '×' ||
        buttonText == '%' ||
        buttonText == '-') {
      print('dddd  ' + textShow);
      firstNum = int.parse(textShow);
      result = "";
      operation = buttonText;
    } else if (buttonText == '=') {
      secondNum = int.parse(textShow);
      if (operation == '+') {
        result = (firstNum + secondNum).toString();
        prev = firstNum.toString() + operation + secondNum.toString();
      }
      if (operation == '-') {
        result = (firstNum - secondNum).toString();
        prev = firstNum.toString() + operation + secondNum.toString();
      }
      if (operation == '×') {
        result = (firstNum * secondNum).toString();
        prev = firstNum.toString() + operation + secondNum.toString();
      }
      if (operation == '%') {
        result = (firstNum % secondNum).toString();
        prev = firstNum.toString() + operation + secondNum.toString();
      }
      if (operation == '÷') {
        result = (firstNum / secondNum).toString();
        prev = firstNum.toString() + operation + secondNum.toString();
      }
    } else {
      result = int.parse(textShow + buttonText).toString();
    }

    setState(() {
      print(result);
      textShow = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0x99FFFCFC),
        appBar: AppBar(
          title: Text('Calculator'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  prev,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textShow,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(height: 2, color: Colors.brown),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('C', buttonColor: Colors.red),
                  buildButton('÷', buttonColor: Colors.black54),
                  buildButton('%', buttonColor: Colors.black54),
                  buildButton('⌫', buttonColor: Colors.brown),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('×', buttonColor: Colors.amber),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('-', buttonColor: Colors.amber),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('+', buttonColor: Colors.amber),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: buildButton('0'), flex: 2),
                  Expanded(child: buildButton('.')),
                  Expanded(child: buildButton('=', buttonColor: Colors.amber)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String buttonText, {Color buttonColor = Colors.black26}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ))),
        onPressed: () {
          // setState(() {
          //   textShow = buttonText;
          // });
          onClick(buttonText);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
