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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Apresentação de Produto',
          style: TextStyle(
            color: Colors.pinkAccent,
          ),
        ),
        leading: Image.network(
          'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/3c/7f/a8/3c7fa815-02e1-f8c1-a68a-b63adfe36e66/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x600wa.png',
          width: 50,
          height: 50,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Anúncios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  createCard(
                    'Produto 1',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Vaga para desenvolvedor Junior com formação em sistemas para Internet valor: 3000.00 (reais)',
                  ),
                  createCard(
                    'Produto 2',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Vaga para desenvolvedor senior com formação em sistemas para Internet valor: 20.000 (reais)',
                  ),
                  createCard(
                    'Produto 3',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Vaga para desenvolvedor Pleno com formação em sistemas para Internet valor: 11.000 (reais)',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCard(String title, String imageUrl, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              height: 20,
              width: 20,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
