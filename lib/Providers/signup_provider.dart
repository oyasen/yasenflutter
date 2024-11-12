import 'package:flutter/cupertino.dart';
import 'package:yasen_osama_0522020_s4/Models/signup_model.dart';
import 'package:yasen_osama_0522020_s4/Services/signup_service.dart';

class SignUpProvider extends ChangeNotifier
{
  SignUpModel? model;
  Future<void> register(SignUpModel user)async
  {
    model = await SignUpService.register(user);
    notifyListeners();
  }
}