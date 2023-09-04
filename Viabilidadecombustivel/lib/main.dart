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
          title: Row(
            children: [
              Text('Comparador de Combustível'),
              SizedBox(width: 10),
              Image.network(
                'http://2.bp.blogspot.com/-FU8QoL07CX0/U91cdzRQhFI/AAAAAAAAAv4/AkjfVFkNxAY/s1600/COMUM+X+ADITIVADA.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.green, // AppBar em verde
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ComparadorCombustivel(),
        ),
      ),
    );
  }
}

class ComparadorCombustivel extends StatefulWidget {
  @override
  _ComparadorCombustivelState createState() => _ComparadorCombustivelState();
}

class _ComparadorCombustivelState extends State<ComparadorCombustivel> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String resultado = '';

  void calcularMelhorCombustivel() {
    setState(() {
      double precoAlcool = double.tryParse(alcoolController.text) ?? 0;
      double precoGasolina = double.tryParse(gasolinaController.text) ?? 0;

      if (precoAlcool == 0 || precoGasolina == 0) {
        resultado = 'Por favor, insira valores válidos!';
        return;
      }

      double relacao = precoAlcool / precoGasolina;

      if (relacao < 0.7) {
        resultado = 'Álcool é mais vantajoso!';
      } else {
        resultado = 'Gasolina é mais vantajosa!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'http://2.bp.blogspot.com/-FU8QoL07CX0/U91cdzRQhFI/AAAAAAAAAv4/AkjfVFkNxAY/s1600/COMUM+X+ADITIVADA.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            TextField(
              controller: alcoolController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço do Álcool',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: gasolinaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularMelhorCombustivel,
              child: Text('Calcular',
                  style: TextStyle(fontSize: 18)), // Aumentado em 20%
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Botão em verde
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
