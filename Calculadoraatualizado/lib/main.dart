import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiplicador e Calculadora'),
          centerTitle: true,
        ),
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
            Image.network(
              'https://www.freeiconspng.com/uploads/calculator-icon-2.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10), // Espaçamento abaixo da imagem
            Container(
              width: 300,
              child: TextField(
                controller: controlador1,
                keyboardType: TextInputType
                    .text, // Alterado para permitir todos os caracteres
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
                keyboardType: TextInputType
                    .text, // Alterado para permitir todos os caracteres
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
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'O resultado é : $resultado',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
