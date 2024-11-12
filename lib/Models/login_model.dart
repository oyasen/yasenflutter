import 'package:yasen_osama_0522020_s4/Screens/login.dart';

class LoginModel
{
  Map<String , dynamic>? data;
  bool? status = false;
  String? message = "";
  LoginModel({required this.data,this.status,this.message});
  factory LoginModel.fromjson(Map<String,dynamic> json)
  {
    return LoginModel(data: json["data"],message: json["message"],status: json["status"]);
  }
  static Map<String,dynamic>? tojson(LoginModel user)
  {
    return user.data;
  }
}