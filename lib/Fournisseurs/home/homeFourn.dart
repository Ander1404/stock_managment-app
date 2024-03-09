
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../ip.dart';
import '../Hero/HeroInfoFournisseur.dart';
import '../Hero/hero_details.dart';
import 'AddFournisseur.dart';
import 'package:http/http.dart' as http;
// ignore: must_be_immutable
class Homefourn extends StatefulWidget {
   const Homefourn({super.key});

  @override
  State<Homefourn> createState() => _HomefournState();
}

class _HomefournState extends State<Homefourn> {
  String adress=currentip();

  double screenheigth=0;

  double screenwith=0;

  List data=[];
  String status='';

Future<void> getrecord () async {
  var url="http://$adress/Salle_db/Type/readtype.php";
  try{
    var response=await http.get(Uri.parse(url));
    if (response.statusCode==200){
      data = jsonDecode(response.body);
      status='Success';
    }
    else{

    }
    
  }
  catch (e){
    print(e);
  }
 }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
  }
  @override
  Widget build(BuildContext context) {
    final controller = HeroItemsFourni();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Fournisseur"),
      // ),
      // backgroundColor: const Color.fromARGB(255, 240, 240, 240),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetailsFournisseur(items: controller.items[index])));
                },
                title: Text(data[index]["NOM"]),
                subtitle: Text(data[index]["NOM"]),
                trailing:  IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.edit_note_outlined)),
                leading: Hero(
                  //Tag should be different
                  //having identical tag will not work in hero animation
                  tag: controller.items[index].image,
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddFournisseur()));
          
            
          },
          //backgroundColor: Colors.orange[900],
          disabledElevation: 10,
          child: const Icon(Icons.add,
         // color: Colors.white,
          ),
        ),
    );
  }
}
