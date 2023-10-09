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
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3c/7f/a8/3c7fa815-02e1-f8c1-a68a-b63adfe36e66/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x600wa.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Banco Fiap",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                Text('Brasileiro'),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Dados Coletados"),
                          content: Text(
                            "Nome: $nome\nIdade: $idade\nSexo: $sexo\nEscolaridade: $escolaridade\nLimite: $limite\nBrasileiro: $brasileiro",
                          ),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
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
