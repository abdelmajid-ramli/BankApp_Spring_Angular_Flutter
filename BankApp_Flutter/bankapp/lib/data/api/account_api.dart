import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/current_account.dart';
import '../models/customer.dart';
import '../models/operation.dart';
import '../models/saving_account.dart';

class AccountApi {
  Future<List<CurrentAccount>> getCurrentAccounts() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('http://localhost:8080/accounts/current/customer/1'));
    if(response.statusCode==200){
      var json=response.body;
      print(response.body);
      client.close();
      return currentAccountFromJson(json);
    }
    List<CurrentAccount> list=List.empty();
    client.close();
    return list;
  }

  Future<List<SavingAccount>> getSavingAccounts() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('http://localhost:8080/accounts/saving/customer/1'));
    if(response.statusCode==200){
      var json=response.body;
      print(response.body);
      client.close();
      return savingAccountFromJson(json);
    }
    List<SavingAccount> list=List.empty();
    client.close();
    return list;
  }

  Future<List<Operation>> getOperations() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('http://localhost:8080/accounts/7b27771f-be63-4813-a99c-3ef0c8835a17/operations'));
    if(response.statusCode==200){
      var json=response.body;
      print(response.body);
      client.close();
      return operationFromJson(json);
    }
    List<Operation> list=List.empty();
    client.close();
    return list;
  }

  Future<bool> login(Customer customer) async {
    var client = http.Client();
    Uri uri=Uri.parse('http://localhost:8080/customers/login');
    String body=jsonEncode(customer.toJson());
    Map<String,String> header={"Content-Type":"application/json"};
    var response = await client.post(uri,headers: header,body: body);
    if(response.statusCode==200 && response.body!=""){
      var json=response.body;
      print("from post method");
      print(response.body);
      Customer fetchedCustomer=customerFromJson(json)[0];
      if(fetchedCustomer.name==customer.name){
        print("loged in");
      }else{
        print("email or password is wrong");
      }
      client.close();
      return true;
    }
    print("email or password is wrong 2");
    client.close();
    return false;
  }
}