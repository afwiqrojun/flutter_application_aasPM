import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profil = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('IMG_20211011_162828.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Selamat datang',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final paragraf1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Halo, nama saya Afwiq Rojun.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '19.0504.0086',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf3 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Universitas Muhammadiyah Magelang.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[profil, welcome, paragraf1, paragraf2, paragraf3],
      ),
    );

    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.close,
          color: Color.fromARGB(255, 244, 182, 12),
        ),
        onPressed: () => Navigator.pop(context),
        backgroundColor: Color.fromRGBO(30, 35, 44, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
