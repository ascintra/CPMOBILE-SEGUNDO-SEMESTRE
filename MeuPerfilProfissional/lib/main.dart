import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeuPerfilProfissional(),
    );
  }
}

class MeuPerfilProfissional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil Profissional'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Adicionado aqui
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://example.com/profile_picture.jpg',
              ),
            ),
          ),
          SizedBox(height: 20),
          informacaoTexto('Nome: André Spinelli Cintra', 24, FontWeight.bold),
          linkGitHub(),
          SizedBox(height: 10),
          informacaoTexto('Formação:', 18, FontWeight.bold),
          informacaoTexto(
              'Superior em Administração de Empresas em Comércio Exterior, cursando Sistemas para Internet e cursando Pós em Cloud Computing.',
              16,
              FontWeight.normal),
          SizedBox(height: 10),
          informacaoTexto('Habilidades:', 18, FontWeight.bold),
          informacaoTexto(
              'Conhecimentos em SO Linux, Windows, redes, JavaScript, Java, HTML5, CSS, PHP, React Native e Flutter.',
              16,
              FontWeight.normal),
          SizedBox(height: 10),
          informacaoTexto('Projeto Destaque:', 18, FontWeight.bold),
          informacaoTexto('Desenvolvimento do aplicativo "Puxa Preço".', 16,
              FontWeight.normal),
        ],
      ),
    );
  }

  Widget informacaoTexto(String texto, double fontSize, FontWeight fontWeight) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        texto,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }

  Widget linkGitHub() {
    return GestureDetector(
      onTap: () {
        print("Abriria o GitHub aqui, mas estamos sem url_launcher.");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GitHub:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'https://github.com/ascintra',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
