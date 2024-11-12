import 'package:dio/dio.dart';
import 'package:yasen_osama_0522020_s4/Models/products_model.dart';
class ProductsService
{
  static Dio dio = Dio();
  static Future<ProductsModel> fetch() async
  {
    try
    {
      const url = "https://student.valuxapps.com/api/home";
      var response = await dio.get(url);
      if(response.statusCode != 200)
      {
        throw Exception("bad request");
      }
      return ProductsModel.fromjson(response.data);
    }
    catch(e)
    {
      throw (e.toString());
    }

  }
}