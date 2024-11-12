import 'package:dio/dio.dart';
import 'package:yasen_osama_0522020_s4/Models/login_model.dart';
class LoginService
{
  static Dio dio = Dio();
  static Future<LoginModel> login(LoginModel user) async
  {
    try
    {
      const url = "https://student.valuxapps.com/api/login";
      var response = await dio.post(url,data: LoginModel.tojson(user));
      if(response.statusCode != 200)
        {
          throw Exception("bad request");
        }
      return LoginModel.fromjson(response.data);
    }
    catch(e)
    {
      throw (e.toString());
    }

  }
}