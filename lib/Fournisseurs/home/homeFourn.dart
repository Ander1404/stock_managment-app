
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
   Future<void> update() async {
try {
  
  var url="http://$adress/API_VENTE/FOURNISSEUR/updatefournisseur.php";
  //print("onclick");
var res=await http.post(Uri.parse(url), 
body: {
  "noms":nom.text,
  "adresse":adresse.text,
  "mail":mail.text,
  "telephone":phone.text,
  "id_fournisseur":code.text
  }     );

var repoe=jsonDecode(res.body);
      //var reponse=jsonDecode(res.body);
      //print(reponse.toString());
      print('object');
      getrecord();
      if(repoe["message"]=="Mise à jour réussie."){
        print("record updated");

        getrecord();
      }
      else if(repoe["error"]=="Paramètres manquants."){
        print("error");
        getrecord();
      }
      else{
     print("Error on update");
      getrecord();
      }
} catch (e) {
print(e);
  
}}

Future<void> delrecord(int id) async {
    try{
      var url="http://$adress/API_VENTE/FOURNISSEUR/deletefournisseur.php";
      
      var result=await http.post(Uri.parse(url),
      body: {
        "id":id
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
  var url="http://$adress/API_VENTE/FOURNISSEUR/getfournisseur.php";
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
 TextEditingController nom=TextEditingController();
  TextEditingController adresse=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController code=TextEditingController();
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
                title: Text(data[index]["noms"]),
                subtitle: Text(data[index]["telephone"]),
                trailing:  IconButton(
                  onPressed: (){
                    setState(() {
                      nom.text=data[index]["noms"];
                      adresse.text= data[index]["adresse"];
                      mail.text=  data[index]["mail"];
                      phone.text=  data[index]["telephone"];
                      code.text=  data[index]["id_fournisseur"].toString();
                    });

                    // EDIT DATAAS
                    showModalBottomSheet(context: context, builder: (context)=>ListView(
      padding: const EdgeInsets.only(right: 25,left: 25),
      children: [
                      const SizedBox(
                        height: 20,
                      ),
                       TextField(
                          controller: nom,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              hintText: "Nom du client", labelText: "Nom")),
                      const SizedBox(height: 20),
                       TextField(
                          controller: adresse,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.place_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              hintText: "Adresse du client",
                              labelText: "Adresse")),
                              const SizedBox(height: 20),
                       TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(    
                            prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),                        
                              hintText: "Contact",
                              labelText: "Contact")),
                              const SizedBox(height: 20),
                       TextField(
                          controller: mail,                          
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            // border: OutlineInputBorder(
                              
                            // ),
                              hintText: "Mail du Fournisseurs",
                              labelText: "mail")
                              ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                       icon: const Icon(
                          Icons.save_alt_outlined,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Confirmer",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: ()
                        {
                        update();
                          setState(() {
                            getrecord();
                          });
                          
                          Navigator.pop(context);
                          
                          },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromARGB(255, 240, 184, 138),
                          fixedSize: const Size(300, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  
    ) 
                    
                    
                    );
                  }, 
                  icon: const Icon(Icons.edit_note_outlined)),
                leading: Hero(
                  //Tag should be different
                  //having identical tag will not work in hero animation
                  tag: data[index]["id_fournisseur"],
                  child: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_3_outlined,),
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
