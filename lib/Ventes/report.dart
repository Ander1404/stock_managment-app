import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocktrue/ip.dart';

import 'package:http/http.dart' as http;
class report extends StatefulWidget {
  const report({super.key});

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  String adress=currentip();
  List data=[];

  Future<void> getrecord () async {
   var url="http://$adress/API_VENTE/VENTE/getvente.php";  
  try{
    var response=await http.get(Uri.parse(url));
    setState(() {
      data=jsonDecode(response.body);
      print(data);
    });    
  }
  catch (e){
    bar(e.toString());
  }
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
  }
   late Future<List<Map<String,dynamic>>> _data;
   Future<List<Map<String,dynamic>>> fetchdata () async {
    final response=await http.post(
      Uri.parse('http://$adress/API_VENTE/DETAILVENTE/Getven.php'),
      body: {
        "date":date
      }
      );          
      if(response.statusCode==200){
        final data=jsonDecode(response.body)as List;
        return data.cast<Map<String,dynamic>>();
      }
      else{
        throw Exception('Failed to load data');
      }
    
  }
 String date='h';
 void bar(String description){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(description),
          duration: const Duration(seconds: 3),
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rapport journalier", style: TextStyle(fontWeight: FontWeight.w400),),
      ),
      body: ListView.builder(
      itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Card(    
                      
                color: Colors.white,  
              elevation: 2,
              // shadowColor:,            
                margin: const EdgeInsets.all(5),
                child: ListTile(                
                  onTap: (){
              
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
                  },
                  title: Text(data[index]["date_vente"]),
                  subtitle: Text("  "),
                  trailing:  IconButton(
                    onPressed: (){
                      setState(() {
                        // code.text=  data[index]["id_fournisseur"].toString();
                      });
                      
                    }, 
                    icon: const Icon(Icons.edit_note_outlined)),
                  leading: Hero(
                    //Tag should be different
                    //having identical tag will not work in hero animation
                    tag: data[index]["date_vente"],
                    child: const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.file_copy_outlined,),
                    ),
                    
                  ),
                ),
              );
            
        }
    )
  ,
    );
  }
}