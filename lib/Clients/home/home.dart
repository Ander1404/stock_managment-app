import 'dart:convert';

import 'package:flutter/material.dart';
import '../../ip.dart';
import '../Hero/hero_details.dart';
import '../Hero/hero_info.dart';
import 'Addclient.dart';
import 'package:http/http.dart' as http;
import 'EditClients.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 String adress=currentip();

  double screenheigth=0;

  double screenwith=0;

  List data=[];
  String status='';
Future<void> delrecord(String id) async {
    try{
      var url="http://$adress/API_VENTE/FOURNISSEUR/deletefournisseur.php";
      
      var result=await http.post(Uri.parse(url),
      body: {
        "id":id.toString()
      }
      );
      var reponse=jsonDecode(result.body);
      if(reponse["Success"]=="True"){
        print("record deleted");
        debugPrint("");
        getrecord();
      }
      else{
        print("Erreur de suppression"); 
        getrecord();
      }

    }
    catch(e){
      print(e);
    }
   }
Future<void> getrecord () async {
   var url="http://$adress/API_VENTE/CLIENT/getclient.php";
  
  try{
    var response=await http.get(Uri.parse(url));    
    setState(() {
      data=jsonDecode(response.body);
      print(data);
    });          
  }
  catch (e){
    print(e);
  }
 }


@override
  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final controller = HeroItems();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Clients"),
      // ),
      body: ListView.builder(
        
          itemCount: data.length,
          itemBuilder: (context,index){
            return Card(              
              color: Colors.white,  
            elevation: 2,
            // shadowColor:,            
              margin: const EdgeInsets.all(5),
              child: ListTile(                
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
                },
                title: Text(data[index]["noms"]),
                subtitle: Text(data[index]["telephone"]),
                trailing:  IconButton(
                  onPressed: (){
                      showModalBottomSheet(context: context, builder: (context)=>EditClients(
                        data[index]["noms"],
                        data[index]["adresse"],
                        data[index]["mail"],
                        data[index]["telephone"],
                        data[index]["id_client"].toString()
                      )                      
                      );
                      setState(() {
                        getrecord();
                      });
                    
                  }, 
                  icon: const Icon(Icons.edit_note_outlined)),
                leading: Hero(
                  //Tag should be different
                  //having identical tag will not work in hero animation
                  tag: data[index]["id_client"],
                  child: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_2_outlined,),
                  ),
                  
                ),
              ),
            );
          }),
      
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddClient()));        
            
          },
          disabledElevation: 10,
          child: const Icon(Icons.add),
          
        ),
    );
  }
}
