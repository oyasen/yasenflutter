import 'package:dio/dio.dart';
import 'package:yasen_osama_0522020_s4/Models/signup_model.dart';
class SignUpService
{
  static Dio dio = Dio();
  static Future<SignUpModel> register(SignUpModel user) async
  {
    try
    {
      const url = "https://student.valuxapps.com/api/register";
      var response = await dio.post(url,data: SignUpModel.tojson(user));
      if(response.statusCode != 200)
        {
         throw Exception("bad request");
        }
      return SignUpModel.fromjson(response.data);
    }
    catch(e)
    {
      throw (e.toString());
    }
  }
}