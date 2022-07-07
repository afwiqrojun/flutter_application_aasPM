import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_aas/style.dart';

class DetailPage extends StatelessWidget {
  final url;
  final title;
  final thumbnail;
  final description;
  final brand;
  final category;
  final price;
  final rating;
  final stock;
  final discount;
  final images;

  DetailPage(
      {this.url,
      this.title,
      this.thumbnail,
      this.description,
      this.brand,
      this.category,
      this.price,
      this.rating,
      this.stock,
      this.discount,
      this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          thumbnail != null
              ? Image.network(
                  thumbnail,
                  width: 400,
                  height: 200,
                  fit: BoxFit.fill,
                )
              : Container(
                  height: 250,
                  width: 100,
                  color: Colors.grey,
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: detailTitle,
                ),
                Text(
                  '$description',
                  style: detailDesc,
                ),
                SizedBox(height: 5),
                Divider(
                  thickness: 1.5,
                ),
                Text(
                  'Brand : $brand',
                  style: detailFont,
                ),
                Text(
                  'Category : $category',
                  style: detailFont,
                ),
                Text(
                  'Price : $price',
                  style: detailFont,
                ),
                Text(
                  'Rating : $rating',
                  style: detailFont,
                ),
                Text(
                  'Stock : $stock',
                  style: detailFont,
                ),
                Text(
                  'Discount : $discount',
                  style: detailFont,
                ),
              ],
            ),
          )
        ],
      ),
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
