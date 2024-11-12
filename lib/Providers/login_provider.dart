import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yasen_osama_0522020_s4/Models/login_model.dart';
import 'package:yasen_osama_0522020_s4/Models/signup_model.dart';
import 'package:yasen_osama_0522020_s4/Screens/login.dart';
import 'package:yasen_osama_0522020_s4/Services/login_service.dart';
import 'package:yasen_osama_0522020_s4/Services/signup_service.dart';

class LoginProvider extends ChangeNotifier
{
  LoginModel? model;
  Future<void> login(LoginModel user)async
  {
    model = await LoginService.login(user);
    notifyListeners();
  }
}