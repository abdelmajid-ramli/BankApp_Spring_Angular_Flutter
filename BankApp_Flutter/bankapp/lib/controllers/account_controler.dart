import 'package:bankapp/data/api/account_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/models/current_account.dart';
import '../data/models/saving_account.dart';

class AccountController extends GetxController{

  late List<CurrentAccount> currentAccounts;
  late List<SavingAccount> savingAccounts;
  bool isLoading=true;

  @override
  void onInit() {
    loadAccounts();
    super.onInit();
  }

  Future<void> loadAccounts() async {
    isLoading=true;
    currentAccounts=await AccountApi().getCurrentAccounts();
    savingAccounts=await AccountApi().getSavingAccounts();
    isLoading=false;
    update();

  }
}