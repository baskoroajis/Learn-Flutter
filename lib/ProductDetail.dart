import 'package:flutter/material.dart';
import 'models/Product.dart';

class ProductDetail extends StatelessWidget{
  ProductDetail({Key key, this.item,}):super(key:key);
  final Product item;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.item.name),),
    );
  }
}