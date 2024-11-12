import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasen_osama_0522020_s4/Providers/login_provider.dart';
import 'package:yasen_osama_0522020_s4/Providers/products_provider.dart';
import 'package:yasen_osama_0522020_s4/Providers/signup_provider.dart';
import 'package:yasen_osama_0522020_s4/Screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => ProductsProvider(),),
      ],
      child: MaterialApp(
        home: Signup(),
      ),
    );
  }
}