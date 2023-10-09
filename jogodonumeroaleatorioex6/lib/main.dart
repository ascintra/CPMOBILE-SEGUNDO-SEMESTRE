import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNumber = 0;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber =
          Random().nextInt(11); // Gera um número aleatório entre 0 e 10
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Jogo do Número Aleatório',
          style: TextStyle(
            color: Colors.pinkAccent,
          ),
        ),
        leading: Image.network(
          'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3c/7f/a8/3c7fa815-02e1-f8c1-a68a-b63adfe36e66/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x600wa.png',
          width: 20,
          height: 20,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Jogo do número aleatório',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3c/7f/a8/3c7fa815-02e1-f8c1-a68a-b63adfe36e66/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x600wa.png',
              width: 250,
              height: 250,
            ),
            SizedBox(height: 40),
            Text(
              'Pense em um número aleatório de 0 a 10',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 0.8,
                ),
              ),
              child: Center(
                child: Text(
                  'O número gerado é: $_randomNumber',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _generateRandomNumber,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text(
                  'Gerar Número',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
