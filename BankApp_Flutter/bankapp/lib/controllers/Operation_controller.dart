import 'package:bankapp/data/api/account_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/models/current_account.dart';
import '../data/models/operation.dart';
import '../data/models/saving_account.dart';

class OperationController extends GetxController{

  late List<Operation> operations;
  bool isLoading=true;

  @override
  void onInit() {
    loadOperations();
    super.onInit();
  }

  Future<void> loadOperations() async {
    isLoading=true;
    operations=await AccountApi().getOperations();
    isLoading=false;
    update();

  }
}