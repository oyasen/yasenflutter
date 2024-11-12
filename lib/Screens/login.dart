import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasen_osama_0522020_s4/Models/login_model.dart';
import 'package:yasen_osama_0522020_s4/Providers/login_provider.dart';
import 'package:yasen_osama_0522020_s4/Screens/products.dart';
import 'package:yasen_osama_0522020_s4/Screens/signup.dart';

import 'package:yasen_osama_0522020_s4/Widgets/custom_formfield.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  validateEmail(String? value)
  {
    if(value == null || value.isEmpty)
    {
      return "field is required";
    }
    if(!value.endsWith("@gmail.com"))
    {
      return "enter valid email";
    }
    if(value.length < 15)
    {
      return "email must be at least 5 characters";
    }
    return null;
  }
  validatePassword(String? value)
  {
    if(value == null || value.isEmpty)
    {
      return "field is required";
    }
    if(value.length < 8)
    {
      return "username must be at least 8 characters";
    }
    return null;
  }

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<LoginProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title:const Text("Login"),
        centerTitle: true,
        actions:const [Icon(Icons.settings)],
      ),
      drawer:const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(backgroundImage: AssetImage("images/86261755.jfif"),radius: 100,),

          Form(
            key: formkey,
            child: Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomFormField(icon:const Icon(Icons.mail), label: "Email", controller: email,validate: validateEmail),
                  CustomFormField(icon:const Icon(Icons.lock),type: "password", label: "Password", controller: password,validate: validatePassword),
                  MaterialButton(onPressed: ()async{
                    if(formkey.currentState!.validate()) {
                      await value.login(LoginModel(
                          data: {
                            "email": email.text,
                            "password": password.text,
                          }));
                      if (value.model?.status == true) {
                        print(value.model?.message);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const Products(),));
                      }
                      else {
                        print(value.model?.message);
                      }
                    }

                  },child: const Text("Login"),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ? "),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                      }, child:const Text("Signup"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
