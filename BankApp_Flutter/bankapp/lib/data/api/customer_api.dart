import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/customer.dart';

class BankApi {
  Future<List<Customer>> getCustomers() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('http://localhost:8080/customers'));
    if(response.statusCode==200){
      var json=response.body;
      print(response.body);
      client.close();
      return customerFromJson(json);
    }
    List<Customer> list=List.empty();
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