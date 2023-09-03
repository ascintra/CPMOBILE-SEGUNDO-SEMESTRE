import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  static const String _titulo = 'Contador de Cliques';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MinhaPaginaInicial(),
    );
  }
}

class MinhaPaginaInicial extends StatefulWidget {
  const MinhaPaginaInicial({super.key});

  @override
  _EstadoMinhaPaginaInicial createState() => _EstadoMinhaPaginaInicial();
}

class _EstadoMinhaPaginaInicial extends State<MinhaPaginaInicial> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _decrementarContador() {
    setState(() {
      if (_contador > 0) {
        // Verificando se o contador é maior que zero
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Cliques em Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você clicou esse número de vezes:',
            ),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _decrementarContador,
                  tooltip: 'Decrementar',
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 20), // Espaço entre os botões
                FloatingActionButton(
                  onPressed: _incrementarContador,
                  tooltip: 'Incrementar',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
