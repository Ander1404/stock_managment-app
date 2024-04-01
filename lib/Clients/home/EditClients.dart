import 'package:flutter/material.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    nom.text=widget.nom;
    adresse.text=widget.adress;
    mail.text=widget.mail;
    phone.text=widget.phone;
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
                        onPressed: () {
                          // savadatas();
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