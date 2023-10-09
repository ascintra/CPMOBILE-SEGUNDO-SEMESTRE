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
          width: 20,
          height: 20,
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
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  createCard(
                    'Produto 1',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Descrição detalhada do produto 1 aqui.',
                  ),
                  createCard(
                    'Produto 2',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Descrição detalhada do produto 2 aqui.',
                  ),
                  createCard(
                    'Produto 3',
                    'https://www.fiap.com.br/wp-content/themes/fiap2016/images/sharing/fiap.png',
                    'Descrição detalhada do produto 3 aqui.',
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 10),
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
    );
  }
}
