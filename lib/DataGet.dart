
import 'dart:convert';
// import 'package:flutter/material.dart';

import 'ip.dart';
import 'package:http/http.dart' as http;
class Dataget {
  List _datadb=[];
  List _newone=[];

  // ignore: unnecessary_getters_setters
  List get newone => _newone;

  set newone(List value) {
    _newone = value;
  }

  // ignore: unnecessary_getters_setters
  List get datadb => _datadb;

  set datadb(List value) {
    _datadb = value;
  }
  String adress=currentip();

  Future<List> getrecordssss () async {
   var url="http://$adress/API_VENTE/APPROVISIONNEMNT/getapprovisionnement.php";
  
  try{
    var response=await http.get(Uri.parse(url));
    if (response.statusCode==200){
      
        datadb=jsonDecode(response.body);
     
      return datadb;
    }         
  }
  catch (e){
    print(e);
  }
  return datadb;
  
 }
  ontry() async {
 datadb=await getrecordssss(); 
}
Future<List> attrib()  async {
 
List a=await getrecordssss();
// print(newlist);
return a;
}
List last (){
  return attrib() as List;
}


}