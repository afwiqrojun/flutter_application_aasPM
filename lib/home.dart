import 'package:flutter/material.dart';
import 'package:flutter_application_aas/about.dart';
import 'package:flutter_application_aas/detail.dart';
import 'package:flutter_application_aas/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _post = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.red, Colors.blue],
            ),
          ),
        ),
        title: Text(
          'Daftar Product Kami',
          style: FontJudul,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
              icon: Icon(Icons.people))
        ],
      ),
      body: ListView.builder(
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  color: Colors.grey,
                  height: 100,
                  width: 100,
                  child: _post[index]['thumbnail'] != null
                      ? Image.network(
                          _post[index]['thumbnail'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : Center(),
                ),
                title: Text(
                  '${_post[index]['title']}',
                  style: Font,
                ),
                subtitle: Text(
                  '${_post[index]['category']}' +
                      " | " +
                      '${_post[index]['brand']}',
                  style: Font,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => DetailPage(
                                thumbnail: _post[index]['thumbnail'],
                                title: _post[index]['title'],
                                description: _post[index]['description'],
                                brand: _post[index]['brand'],
                                category: _post[index]['category'],
                                price: _post[index]['price'],
                                rating: _post[index]['rating'],
                                stock: _post[index]['stock'],
                                discount: _post[index]['discountPercentage'],
                              )));
                },
              ),
            );
          }),
    );
  }

  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _post = data['products'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
