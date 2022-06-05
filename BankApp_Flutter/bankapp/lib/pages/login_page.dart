import 'package:bankapp/data/api/account_api.dart';
import 'package:bankapp/data/api/customer_api.dart';
import 'package:bankapp/pages/accounts_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/models/customer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            TextField(
              decoration: new InputDecoration(
                  hintText: 'Email'
              ),
              controller: emailController,
            ),
            TextField(
              decoration: new InputDecoration(

                  hintText: 'Password'
              ),
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 20,),
            RaisedButton(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                BankApi().login(Customer(
                    id: 1,
                    name: passwordController.text,
                    email: emailController.text)
                );
                Get.to(AccountPage(),arguments: 1);
                },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
