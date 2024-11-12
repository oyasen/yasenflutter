import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasen_osama_0522020_s4/Models/signup_model.dart';
import 'package:yasen_osama_0522020_s4/Providers/signup_provider.dart';
import 'package:yasen_osama_0522020_s4/Screens/login.dart';
import 'package:yasen_osama_0522020_s4/Screens/products.dart';
import 'package:yasen_osama_0522020_s4/Widgets/custom_formfield.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  validateUser(String? value)
  {
    if(value == null || value.isEmpty)
    {
      return "field is required";
    }
    if(value.length < 5)
      {
        return "username must be at least 5 characters";
      }
    return null;
  }
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

  validatePhone(String? value)
  {
    if(value == null || value.isEmpty)
      {
        return "field is required";
      }
    if(value.length != 11)
    {
      return "phone must be 11 number";
    }
    return null;
  }
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<SignUpProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title:const Text("Signup"),
        centerTitle: true,
        actions:const [Icon(Icons.settings)],
      ),
      drawer:const Drawer(),
      body: Form(
        key: formkey,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFormField(icon:const Icon(Icons.account_circle), label: "Your Name", controller: username,validate: validateUser,),
              CustomFormField(icon:const Icon(Icons.mail), label: "Email", controller: email,validate: validateEmail),
              CustomFormField(icon:const Icon(Icons.phone), type: "phone",label: "Phone", controller: phone,validate: validatePhone),
              CustomFormField(icon:const Icon(Icons.lock), type: "password",label: "Password", controller: password,validate: validatePassword),
              MaterialButton(onPressed: ()async{
                if(formkey.currentState!.validate()) {
                  await value.register(SignUpModel(data: {
                    "email": email.text,
                    "password": password.text,
                    "name": username.text,
                    "phone":phone.text
                  }));
                  if (value.model?.status == true) {
                    print(value.model?.message);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  }
                else {
                    print(value.model?.message);
                  }
                }

              },child: const Text("Signup"),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? "),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  }, child:const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
