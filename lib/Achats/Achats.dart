

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stocktrue/Achats/DetailAchat/Listdetail.dart';
import 'package:stocktrue/Ventes/AddVentes.dart';
import 'package:http/http.dart' as http;

import '../ip.dart';

class Achats extends StatefulWidget {  
   const Achats(
    {super.key}   
    );

  @override
  State<Achats> createState() => _AchatsState();
}

class _AchatsState extends State<Achats> {
  DateTime date=DateTime.now();
   String text="";
   TextEditingController dateone=TextEditingController();
  String adress=currentip();
  var selectedvalue;
  var selectedname;
  List data=[];
  String status='';
//    Future <void> delrecord(String id) async{
//     var url="http://$adress/API_VENTE/APPROVISIONNEMNT/deleteapprovisionnement.php";
//  final response=await http.post(
//       Uri.parse(url),
//       body: {
//         "id_produit":id.toString()
//       }
//       );          
//       if(response.statusCode==200){
//         print("Success delete");        // final data=
//       }
//       else{
//         throw Exception('Failed to load data');
//       }
//   }
  Future<void> delrecord(var id) async {
    try{
      var url="http://$adress/API_VENTE/APPROVISIONNEMNT/deleteapprovisionnement.php";
      String newid=id.toString();
      var result=await http.post(Uri.parse(url),
      body: {
        "id":newid.toString(),
      }
      );
      var reponse=jsonDecode(result.body);
      getrecord();
      if(reponse["Success"]=="Succes"){
        print("record deleted");
        debugPrint("");
        getrecord();
      }
      else{
        bar("Success");
        print("Success de suppression"); 
        getrecord();
      }

    }
    catch(e){
      print(e);
    }
   }
    
Future<void> getrecord () async {
   var url="http://$adress/API_VENTE/APPROVISIONNEMNT/getapprovisionnement.php";  
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
 List d=[];
 Future<void> getrecords () async {
   var url="http://$adress/API_VENTE/FOURNISSEUR/getfournisseur.php";  
  try{
    var response=await http.get(Uri.parse(url));
    setState(() {
      d=jsonDecode(response.body);
      print(d);
    });    
  }
  catch (e){
    print(e);
  }
 }
 
 @override
  initState() { 
    getrecord(); 
    getrecords(); 
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
        actions:  [IconButton(onPressed: (){
          showAboutDialog(context: context);
        }, icon: const Icon(Icons.info_outline))],
        title: const Text("FourniStore",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
            return data.isEmpty?const CircularProgressIndicator():
            Slidable(
              key: Key('$index'),
              endActionPane: ActionPane(motion: const ScrollMotion(),               
              children: [
                SlidableAction(onPressed: (context){
                  // showModalBottomSheet(context: context, builder: (context)=>ListView());
                  // showBottomSheet(context: context, builder: (context)=>ListView());                   
                   showDialog(context: context, builder: (BuildContext context){
              return Dialog( 
                                               
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView(
                    children: [
                      const Text(
                        "Edit un achat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      
            DropdownButtonFormField(
            // hint: const Text("Select client"),
          //  if(){}
            items:d.map((list){
                return DropdownMenuItem(   
                  value: list["id_fournisseur"],
                  child: Text(list["noms"]),
                  );
          }
          ).toList(),
          //onChanged: onChanged,
          
          value: selectedvalue,          
          icon: const Icon(Icons.arrow_drop_down_circle),
          decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Fournisseur",
                  labelText: "Fournisseur"),
          onChanged: (value){
            selectedvalue=value;
            // client=selectedvalue;
            setState(() {
              selectedname=value.toString();
            });
            
            print(selectedname);
          },
              ),
              const SizedBox(height: 25,),
              Padding(padding: const  EdgeInsets.only(right: 10,bottom: 10,left: 10),
          child: TextField(            
            controller: dateone,
            decoration: const InputDecoration(
            labelText: "Date de l'achat",
            filled: true,
            prefixIcon: Icon(
              Icons.calendar_today_outlined),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,             
              
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              //borderRadius:
            ),
            //fillColor: Colors.green,
            focusColor: Colors.green,
            
           // hoverColor: Colors.green
          ),
          readOnly: true,
          onTap: () {
            _selected(dateone);
          },
          ),
          
          ), 
          const SizedBox(height: 15,),
          ElevatedButton.icon(
                        icon: const Icon(
                          Icons.save_alt_outlined,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          updatedatas(data[index]["id_approvisionnement"].toString(),selectedname);
                          () => Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          // elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 227, 174, 131),
                          // fixedSize: const Size(60, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )
                    
             

                    ],
                  ),
                  )
                );
            });
          
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
                                  print(data[index]["id_approvisionnement"]);
                                  delrecord(data[index]["id_approvisionnement"].toString());
                                  setState(() {
                             Navigator.pop(context);
                          });
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
              ]
              ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Listdetail(data[index]["id_approvisionnement"].toString())));
                  },
                  // data[index]["id_approvisionnement"]
                  title:  Text(data[index]["fournisseur"],style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                )),
                  // subtitle: Text(data[index]["noms"],style: const TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 16
                  //               )),
                  trailing:  Text(data[index]["date_approvisionnement"]),
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
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Addventes())); 
            showDialog(context: context, builder: (BuildContext context){
              return Dialog(                                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView(
                    children: [
                      const Text(
                        "Faire un Achat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      
            DropdownButtonFormField(
            // hint: const Text("Select client"),
          //  if(){}
            items:d.map((list){
              if(d.isEmpty){
                // return Circ;
              }
                return DropdownMenuItem(   
                  value: list["id_fournisseur"],
                  child: Text(list["noms"]),
                  );
          }
          ).toList(),
          //onChanged: onChanged,
          
          value: selectedvalue,          
          icon: const Icon(Icons.arrow_drop_down_circle),
          decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Fournisseur",
                  labelText: "Fournisseur"),
          onChanged: (value){
            selectedvalue=value;
            // client=selectedvalue;
            setState(() {
              selectedname=value.toString();
            });
            
            print(selectedname);
          },
              ),
              const SizedBox(height: 25,),
              Padding(padding: const  EdgeInsets.only(right: 10,bottom: 10,left: 10),
          child: TextField(            
            controller: dateone,
            decoration: const InputDecoration(
            labelText: "Date de l'achat",
            filled: true,
            prefixIcon: Icon(
              Icons.calendar_today_outlined),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,             
              
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              //borderRadius:
            ),
            //fillColor: Colors.green,
            focusColor: Colors.green,
            
           // hoverColor: Colors.green
          ),
          readOnly: true,
          onTap: () {
            _selected(dateone);
          },
          ),
          
          ), 
          const SizedBox(height: 15,),
          ElevatedButton.icon(
                        icon: const Icon(
                          Icons.save_alt_outlined,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          savadatas();
                          setState(() {
                             Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          // elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 227, 174, 131),
                          // fixedSize: const Size(60, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )
                    
             

                    ],
                  ),
                  )
                );
            });
          
          },
          // backgroundColor: Colors.orange[900],
          disabledElevation: 10,
          child: const Icon(Icons.add,
          color: Colors.black,
          ),
        ),      
    );
  }
  var app;
  Future<void> updatedatas(String va,String v) async {    
    try {
      var url = "http://$adress/API_VENTE/APPROVISIONNEMNT/updateapprovisionnement.php";
      Uri ulr = Uri.parse(url);
      var request = http.MultipartRequest('POST', ulr);
      request.fields['id_approvionnement'] = va;
      request.fields['fournisseur_id'] = "7";
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        bar("Success insert");
        getrecord();
      } else {
        bar("Error insert");
      }
    } catch (e) {
      bar(e.toString());
      print(e);
    }
  }
  Future<void> savadatas() async {    
    try {
      var url = "http://$adress/API_VENTE/APPROVISIONNEMNT/insertapprovisionnement.php";
      Uri ulr = Uri.parse(url);
      var request = http.MultipartRequest('POST', ulr);
      request.fields['fournisseur_id'] = selectedname;
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        bar("Success insert");
        getrecord();
      } else {
        bar("Error insert");
      }
    } catch (e) {
      bar(e.toString());
      print(e);
    }
  }
  
   void bar(String description){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(description),
          duration: const Duration(seconds: 3),
        ),
      );
  }

  Future<void> _selected(TextEditingController date) async{
  DateTime? _picked= await showDatePicker(
    context: context, 
    initialDate: DateTime.now(),
    firstDate: DateTime(2020), 
    lastDate: DateTime(2100)
    );

    if(_picked !=null){
      setState(() {
        date.text=_picked.toString().split(" ")[0];
      });
    }
    else{
      setState(() {
        date.text="2024-29-9";
      });
    }
}
}