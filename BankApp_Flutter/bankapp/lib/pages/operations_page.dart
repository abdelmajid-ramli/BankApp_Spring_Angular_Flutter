import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/Operation_controller.dart';

class OperationsPage extends StatefulWidget {
  const OperationsPage({Key? key}) : super(key: key);

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  var operations = Get.put(OperationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Operations"),),
      body: GetBuilder<OperationController>(
        builder: (controller) {
          if(operations.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container(
              margin: const EdgeInsets.only(top: 40),
              child: ListView.builder(
                  itemCount: operations.operations.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        print(index);
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
                                  child: Text("Amount : ${operations.operations[index].amount}",
                                      style: TextStyle(fontSize: 25)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text("Type : ${operations.operations[index].type}",
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
