import 'package:flutter/material.dart';

void main() {
  runApp(CalculaImc());
}

class CalculaImc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  double _peso = 0;
  double _altura = 0;
  String _resultado = '';

  void calcular() {
    setState(() {
      double res = _peso / (_altura * _altura);
      if (res < 18.5)
        _resultado = 'Abaixo do peso';
      else if (res < 24.9)
        _resultado = 'Peso normal';
      else if (res < 29.9)
        _resultado = 'Sobrepeso';
      else if (res < 34.9)
        _resultado = 'Obesidade Grau I';
      else if (res < 39.9)
        _resultado = 'Obesidade Grau II';
      else
        _resultado = 'Obesidade Grau III ou Mórbida';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo do IMC'),
        centerTitle: true,
        backgroundColor: Colors.green, // Tom de verde
      ),
      body: Center(
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
                'https://b863587.smushcdn.com/863587/wp-content/uploads/2013/11/INDICE-DE-MASSA-CORPORAL-DIABETES-406x233.png?lossy=1&strip=1&webp=1',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite o seu peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) => _peso = double.tryParse(value) ?? 0,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite a sua altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) => _altura = double.tryParse(value) ?? 0,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcular,
                child: Text('Calcular',
                    style: TextStyle(
                        fontSize:
                            18)), // Aumentado em 20% do tamanho do professor
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Botão em verde
                ),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
