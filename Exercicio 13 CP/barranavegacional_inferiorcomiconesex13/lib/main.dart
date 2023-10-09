import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _selectedIndex = 0;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      DadosPessoais(
        nomeController: nomeController,
        idadeController: idadeController,
        sexoController: sexoController,
      ),
      FormacaoInfo(), // Adicionando a tela de Formação
      Text('Experiência'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Curricullum Vitae APP'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_outlined),
            label: 'Pessoal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experiência',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DadosPessoais extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController idadeController;
  final TextEditingController sexoController;

  DadosPessoais({
    required this.nomeController,
    required this.idadeController,
    required this.sexoController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Text(
              "A",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: idadeController,
            decoration: InputDecoration(
              labelText: 'Idade',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: sexoController,
            decoration: InputDecoration(
              labelText: 'Sexo',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Dados Enviados"),
                    content: Text(
                        "Nome: ${nomeController.text}\nIdade: ${idadeController.text}\nSexo: ${sexoController.text}"),
                  );
                },
              );
            },
            child: Text("Enviar"),
          ),
        ],
      ),
    );
  }
}

class FormacaoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Formação:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Bacharelado em Administração de Empresas'),
          Text('Tecnólogo em Sistemas para Internet'),
          Text('Pós-graduação em Cloud Computing'),
          Text('Mestrado em ...'), // Adicione sua área de mestrado aqui
          SizedBox(height: 20),
          Text(
            'Certificações:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('AWS Certified Practitioner'),
          Text('Microsoft Azure AZ-900'),
          Text('Linux Essentials'),
        ],
      ),
    );
  }
}
