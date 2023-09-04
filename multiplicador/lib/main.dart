import 'package:flutter/material.dart';

void main() {
  runApp(Multiplicador());
}

class Multiplicador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Multiplicador de Números'),
              SizedBox(width: 10),
              Image.network(
                'https://www.freeiconspng.com/uploads/calculator-icon-2.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.blue, // cor azul do AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Multiplicador(),
        ),
      ),
    );
  }
}

class Multiplicador extends StatefulWidget {
  @override
  _MultiplicadorState createState() => _MultiplicadorState();
}

class _MultiplicadorState extends State<Multiplicador> {
  TextEditingController controlador1 = TextEditingController();
  TextEditingController controlador2 = TextEditingController();
  String resultado = '';

  void calcular() {
    setState(() {
      double num1 = double.tryParse(controlador1.text) ?? 0;
      double num2 = double.tryParse(controlador2.text) ?? 0;
      var res = num1 * num2;
      resultado = 'Resultado: $res';
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
            SizedBox(height: 20), // Espaço de 20 após a imagem
            Container(
              width: 300,
              child: TextField(
                controller: controlador1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Digite o primeiro número...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: TextField(
                controller: controlador2,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Digite o segundo número...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text(
                'Calcular',
                style: TextStyle(fontSize: 18), // 30% maior
              ),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
