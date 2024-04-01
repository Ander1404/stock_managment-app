import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stocktrue/Ventes/AddVentes.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class Ventes extends StatefulWidget {
  const Ventes({super.key});

  @override
  State<Ventes> createState() => _VentesState();
}

class _VentesState extends State<Ventes> {
  List data=[];
  String adress=currentip();
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
    print(e);
  }
 }
  Future<void> delrecord(var id) async {
    try{
      String adress=currentip();
      var url="http://$adress/API_VENTE/APPROVISIONNEMNT/deleteapprovisionnement.php";
      // String newid=id;
      var result=await http.post(Uri.parse(url),
      body: {
        "id":id,
      }
      );
      var reponse=jsonDecode(result.body);
      if(reponse["Success"]=="succes"){
        print("record deleted");
        debugPrint("");
        // getrecord();
      }
      else{
        print("Erreur de suppression"); 
        // getrecord();
      }

    }
    catch(e){
      print(e);
    }
   }
    @override
  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
  }
  double screenheigth=0;
  double screenwith=0;
  @override
  Widget build(BuildContext context) {
     screenwith=MediaQuery.of(context).size.width;
     screenheigth=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info_outline))],
        title: const Text("FourniMag",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
      ),
      body: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
            return Slidable(
              key: Key('$index'),
              endActionPane: ActionPane(motion: const ScrollMotion(),               
              children: [
                SlidableAction(onPressed: (context){
                  // showModalBottomSheet(context: context, builder: (context)=>ListView());
                  // showBottomSheet(context: context, builder: (context)=>ListView());                   
                  setState(() {
                    
                  });
                  
                  const DecoratedBox(
                    decoration: BoxDecoration(
                        
                  ),
                  );
                },
                
                //backgroundColor: const Color.fromARGB(255, 11, 92, 23),
                foregroundColor: const Color.fromARGB(255, 11, 92, 23),
                icon: Icons.insert_drive_file_sharp,
                
                ),
                const SizedBox(width: 10,),
                SlidableAction(onPressed: (context){
                  //showAdaptiveDialog(context: context, builder: (context)=>Center(child: Text("Erreur de modification")));
                showDialog(context: context, builder: (context)=>CupertinoAlertDialog(//   AlertDialog.adaptive(
                    
                    title: const Text("Voulez-vous vraiment supprimer ?"),
                    actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [TextButton(onPressed: (){
                                  print(data[index]["id_vente"]);
                                  delrecord(data[index]["id_vente"].toString());
                              }, child: const Text("Effectuer"))
                            ],
                          )
                    ],
                   )
                   );
                },
                foregroundColor: Colors.red,
                icon: Icons.delete,
                )
              ]),
              child: Padding(
                padding:  const EdgeInsets.symmetric(vertical: 2.0),
                child: Container(                                                        
                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  padding: const EdgeInsets.all(0.0),
                  height: 90,
                  decoration: BoxDecoration(                    
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow:  const [
                       BoxShadow(                        
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        color: Colors.transparent,
                      )
                    ]
                  ),
                  child:Card(
                elevation: 0.5,
                child: ListTile(                
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
                  },
                  // data[index]["id_approvisionnement"]
                  title:  Text(data[index]["client"],style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )),
                  // subtitle: Text(data[index]["noms"],style: const TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 16
                  //               )),
                  trailing:  Text(data[index]["date_vente"]),
                  leading:  Text(
                          "${index +1}. ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400
                          ),
                          ),
                    
                  ),
              )
                ),
              ),
            
            );
        
        
        }
        ),
      
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Addventes()));            
          },
          // backgroundColor: Colors.orange[900],
          disabledElevation: 10,
          child: const Icon(Icons.add,
          // color: Colors.white,
          ),
        ),      
    );
  }
}