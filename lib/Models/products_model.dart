import 'package:flutter/foundation.dart';

class ProductsModel
{
  List<dynamic> products;
  ProductsModel({required this.products});
  factory ProductsModel.fromjson(Map<String,dynamic> json)
  {
    return ProductsModel(products: json["data"]["products"]);
  }
}