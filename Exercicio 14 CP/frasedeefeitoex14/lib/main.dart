import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dia = false;
  bool pequeno = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Frases'),
          backgroundColor: Color(0xffe72f6c),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Dia'),
                  Switch(
                    value: dia,
                    onChanged: (value) {
                      setState(() {
                        dia = value;
                      });
                    },
                  ),
                  Text('Pequeno'),
                  Switch(
                    value: pequeno,
                    onChanged: (value) {
                      setState(() {
                        pequeno = value;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: dia ? Colors.white : Colors.black,
                    border: Border.all(color: Color(0xffe72f6c), width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'A vingança nunca é plena, mata a alma e envenena!',
                      style: TextStyle(
                        color: dia ? Colors.black : Colors.white,
                        fontSize: pequeno ? 12 : 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
