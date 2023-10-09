import 'package:flutter/material.dart';

void main() {
  runApp(FormularioDeConta());
}

class FormularioDeConta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaDoFormulario(),
    );
  }
}

class PaginaDoFormulario extends StatefulWidget {
  @override
  _PaginaDoFormularioState createState() => _PaginaDoFormularioState();
}

class _PaginaDoFormularioState extends State<PaginaDoFormulario> {
  String nome = "";
  String idade = "";
  String sexo = "Masculino";
  String escolaridade = "Ensino Médio";
  double limite = 0.0;
  String brasileiro = "Sim";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Abertura de Conta'),
        centerTitle: true,
        backgroundColor: Color(0xffe72f6c),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color: Color(0xffe72f6c), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (valor) {
                    nome = valor;
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (valor) {
                    idade = valor;
                  },
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: sexo,
                  items: ['Masculino', 'Feminino'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      sexo = newValue!;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: escolaridade,
                  items: ['Ensino Médio', 'Superior'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      escolaridade = newValue!;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: brasileiro,
                  items: ['Sim', 'Não'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      brasileiro = newValue!;
                    });
                  },
                ),
                SizedBox(height: 10),
                Slider(
                  value: limite,
                  min: 0,
                  max: 45500,
                  divisions: 10,
                  label: limite.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      limite = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Limite: R\$ ${limite.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resultado(
                          nome: nome,
                          idade: idade,
                          sexo: sexo,
                          escolaridade: escolaridade,
                          limite: limite,
                          brasileiro: brasileiro,
                        ),
                      ),
                    );
                  },
                  child: Text('Confirmar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffe72f6c),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Resultado extends StatelessWidget {
  final String nome, idade, sexo, escolaridade, brasileiro;
  final double limite;

  Resultado({
    required this.nome,
    required this.idade,
    required this.sexo,
    required this.escolaridade,
    required this.limite,
    required this.brasileiro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: Color(0xffe72f6c),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: $nome'),
            Text('Idade: $idade'),
            Text('Sexo: $sexo'),
            Text('Escolaridade: $escolaridade'),
            Text('Limite: $limite'),
            Text('Brasileiro: $brasileiro'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe72f6c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
