import 'package:bankapp/pages/accounts_page.dart';
import 'package:bankapp/pages/login_page.dart';
import 'package:bankapp/pages/operations_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(){ return runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bank app',
      home: LoginPage(),
    );
  }
}
