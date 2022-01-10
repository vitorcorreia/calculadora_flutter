// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String display = "";
  String operacao = "";
  double num1 = 0;
  double num2 = 0;

  void addValor(double num) {
    if (num1 == 0) {
      num1 = num;
    } else {
      num2 = num;
    }
  }

  void result() {
    switch (operacao) {
      case 'soma':
        double resultado;
        resultado = (num1 + num2);

        setState(() {
          display = resultado.toString();
        });

        num1 = resultado;
        num2 = 0;
        break;
      case 'subtracao':
        double resultado;
        resultado = (num1 - num2);

        setState(() {
          display = resultado.toString();
        });

        num1 = resultado;
        num2 = 0;
        break;
      case 'multiplicacao':
        double resultado;
        resultado = (num1 * num2);

        setState(() {
          display = resultado.toString();
        });

        num1 = resultado;
        num2 = 0;
        break;
      case 'divisao':
        double resultado;
        resultado = (num1 / num2);

        setState(() {
          display = resultado.toString();
        });

        num1 = resultado;
        num2 = 0;
        break;
      default:
        print("entrei no default");
        break;
    }
  }

  void addOperacao(String op) {
    if (operacao == "") {
      operacao = op;
    } else {
      result();
      operacao = op;
    }
  }

  void input(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setState(() {
          display += tecla;
        });
        break;
      case 'AC':
        num1 = 0;
        num2 = 0;
        operacao = "";
        setState(() {
          display = '';
        });
        break;
      case "+":
        addValor(double.parse(display));
        addOperacao('soma');
        setState(() {
          display = "";
        });
        //print(operacao);
        break;
      case "/":
        addValor(double.parse(display));
        addOperacao('divisao');
        setState(() {
          display = "";
        });
        //print(operacao);
        break;
      case "-":
        addValor(double.parse(display));
        addOperacao('subtracao');
        setState(() {
          display = "";
        });
        //print(operacao);
        break;
      case "x":
        addValor(double.parse(display));
        addOperacao('multiplicacao');
        setState(() {
          display = "";
        });
        //print(operacao);
        break;
      case '=':
        if (num1 != 0) {
          num2 = double.parse(display);
        } else {
          num1 = double.parse(display);
        }
        result();
        break;

      default:
        //display += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Calculadora'),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(display, style: TextStyle(fontSize: 72))],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      input('AC');
                      print('AC');
                    },
                    child: Text(
                      'AC',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  Text(''),
                  Text(''),
                  Image.asset(
                    'assets/img/arrowback.png',
                    width: 48,
                    // scale: 100,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      input('7');
                    },
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('8'),
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('9'),
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('/'),
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => input('4'),
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('5'),
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('6'),
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('x'),
                    child: Text(
                      'x',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => input('1'),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('2'),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('3'),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('-'),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => input('0'),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input(','),
                    child: Text(
                      ',',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => input('='),
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      input("+");
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              Text(
                'Coluna 7',
                style: TextStyle(fontSize: 48),
              ),
            ],
          )),
    );
  }
}
