import 'package:bankapp/controllers/account_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'operations_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var accounts = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accounts"),),
      body: GetBuilder<AccountController>(
        builder: (controller) {
          if(accounts.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container(
              margin: const EdgeInsets.only(top: 40),
              child: ListView.builder(
                  itemCount: accounts.currentAccounts.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        print(index);
                        Get.to(OperationsPage(),arguments: 1);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(4,4),
                              blurRadius: 10,
                            )
                          ],

                        ),
                        child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text("Balance : ${accounts.currentAccounts[index].balance}",
                                        style: TextStyle(fontSize: 25)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text("OverDraft : ${accounts.currentAccounts[index].overDraft}",
                                        style: TextStyle(fontSize: 20)),
                                  )
                                ],
                              ),
                              Container(
                                color: Colors.black45,
                                height: 0,
                              )

                            ],
                        ),
                      ),
                    );
                  }
              ),
            );

          }
        },
      ),
    );
  }
}
