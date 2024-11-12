import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({super.key,required this.icon,required this.label,required this.controller,required this.validate,this.type});
  Icon icon;
  String label;
  TextEditingController controller;
  Function validate;
  String? type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscuringCharacter: "*",
        obscureText: type=="password"?true:false,
        keyboardType: type=="phone"?TextInputType.number:TextInputType.text,
        validator: (value) => validate(value),
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: icon,
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))
        ),
      ),
    );
  }
}
