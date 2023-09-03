import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Calculadora(),
        ),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _EstadoCalculadora createState() => _EstadoCalculadora();
}

class _EstadoCalculadora extends State<Calculadora> {
  TextEditingController controlador1 = TextEditingController();
  TextEditingController controlador2 = TextEditingController();
  String resultado = "";

  void calcular() {
    setState(() {
      try {
        double num2 = double.parse(controlador2.text);
        String operacao = controlador1.text.trim();
        double num1 = double.parse(operacao.substring(0, operacao.length - 1));
        String operador = operacao.substring(operacao.length - 1);

        switch (operador) {
          case '+':
            resultado = (num1 + num2).toString();
            break;
          case '-':
            resultado = (num1 - num2).toString();
            break;
          case '*':
            resultado = (num1 * num2).toString();
            break;
          case '/':
            if (num2 != 0) {
              resultado = (num1 / num2).toString();
            } else {
              resultado = "Divisão por zero";
            }
            break;
          default:
            resultado = "Operador inválido";
        }
      } catch (e) {
        resultado = "Expressão inválida";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: controlador1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Insira o valor e operador +,-,*,/',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: controlador2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Insira o segundo valor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
