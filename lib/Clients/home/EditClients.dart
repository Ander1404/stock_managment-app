import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocktrue/ip.dart';
// ignore: must_be_immutable
class EditClients extends StatefulWidget {
  String nom="";
  String adress="";
  String mail="";
  String phone="";
  String id="";
   EditClients(
    this.nom,this.adress,this.mail,this.phone,this.id,
    {super.key}
    );

  @override
  State<EditClients> createState() => _EditClientsState();
}

class _EditClientsState extends State<EditClients> {
  
  TextEditingController nom=TextEditingController();
  TextEditingController adresse=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController code=TextEditingController();
  
String adress=currentip();  

  Future<void> update() async {
try {
  
  var url="http://$adress/API_VENTE/CLIENT/updateclient.php";
  //print("onclick");
var res=await http.post(Uri.parse(url), 
body: {
  "noms":nom.text,
  "adresse":adresse.text,
  "mail":mail.text,
  "telephone":phone.text,
  "id":code.text
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
List data=[];
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
    nom.text=widget.nom;
    adresse.text=widget.adress;
    mail.text=widget.mail;
    phone.text=widget.phone;    
    code.text=widget.id;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                              hintText: "Contact du client",
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
                              hintText: "Mail du client",
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
                  
    );
  }
}