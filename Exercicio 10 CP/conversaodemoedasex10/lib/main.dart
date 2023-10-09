import 'package:flutter/material.dart';

void main() {
  runApp(ConversorDeMoedas());
}

class ConversorDeMoedas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaDoConversor(),
    );
  }
}

class PaginaDoConversor extends StatefulWidget {
  @override
  _PaginaDoConversorState createState() => _PaginaDoConversorState();
}

class _PaginaDoConversorState extends State<PaginaDoConversor> {
  double _valor = 0;
  String _moedaSelecionada = 'Dólar';
  String _valorConvertido = "0.00";
  String _tipoDeConversao = 'De Real para';

  void converter() {
    setState(() {
      double valorTemporario;
      switch (_moedaSelecionada) {
        case 'Dólar':
          valorTemporario =
              _tipoDeConversao == 'De para Real' ? _valor * 5.3 : _valor / 5.3;
          break;
        case 'Euro':
          valorTemporario =
              _tipoDeConversao == 'De para Real' ? _valor * 6.2 : _valor / 6.2;
          break;
        case 'Iene':
          valorTemporario = _tipoDeConversao == 'De para Real'
              ? _valor * 0.048
              : _valor / 0.048;
          break;
        case 'Yuan':
          valorTemporario = _tipoDeConversao == 'De para Real'
              ? _valor * 0.82
              : _valor / 0.82;
          break;
        default:
          valorTemporario = 0.0;
      }
      _valorConvertido = valorTemporario.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://http2.mlstatic.com/D_NQ_NP_665726-MLB54882514251_042023-O.webp',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite o valor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (valor) => _valor = double.tryParse(valor) ?? 0,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _tipoDeConversao,
                items: [
                  'De Real para',
                  'De para Real',
                ].map<DropdownMenuItem<String>>((String valor) {
                  return DropdownMenuItem<String>(
                    value: valor,
                    child: Text(valor),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    _tipoDeConversao = novoValor!;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _moedaSelecionada,
                items: [
                  'Dólar',
                  'Euro',
                  'Iene',
                  'Yuan',
                ].map<DropdownMenuItem<String>>((String valor) {
                  return DropdownMenuItem<String>(
                    value: valor,
                    child: Text(valor),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    _moedaSelecionada = novoValor!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: converter,
                child: Text('Converter'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffe72f6c),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _tipoDeConversao == 'De para Real'
                    ? 'Valor convertido para Real: R\$ $_valorConvertido'
                    : 'Valor convertido: $_valorConvertido $_moedaSelecionada',
                style: TextStyle(fontSize: 24, color: Color(0xffe72f6c)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
