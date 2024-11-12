import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  CustomProduct({super.key,required this.name,required this.price,required this.img});
  String img;
  String name;
  String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow:[BoxShadow(offset: Offset(0, 5),blurRadius: 5,color: Colors.black)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(img,height: 100,),
          Text(name,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
          Text(price,style:const TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}
