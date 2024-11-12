import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yasen_osama_0522020_s4/Models/products_model.dart';
import 'package:yasen_osama_0522020_s4/Services/products_service.dart';

class ProductsProvider extends ChangeNotifier
{
  ProductsModel? model;
  Future<void> fetch()async
  {
    model = await ProductsService.fetch();
    notifyListeners();
  }
}