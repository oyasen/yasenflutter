import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key,required this.name,required this.description,required this.img});
  String img;
  String name;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(img),
            Text(name,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text(description,style:const TextStyle(fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
