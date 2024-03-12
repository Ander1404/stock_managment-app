

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stocktrue/Ventes/AddVentes.dart';
import 'package:http/http.dart' as http;

class Achats extends StatefulWidget {
  const Achats({super.key});

  @override
  State<Achats> createState() => _AchatsState();
}

class _AchatsState extends State<Achats> {
  void delete(){
    
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
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info_outline))],
        title: const Text("FourniStore",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(onPressed: (){
                               
                              }, child: const Text("Annuler",style: TextStyle(color: Colors.black),)),
                              TextButton(onPressed: (){

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
                  title: const Text("nomsmmmmmmmmm",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )),
                  subtitle: Text("telephone",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )),
                  trailing:  Text("26 janvier 2020'"),
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
          backgroundColor: Colors.orange[900],
          disabledElevation: 10,
          child: const Icon(Icons.add,
          color: Colors.white,
          ),
        ),      
    );
  }
}