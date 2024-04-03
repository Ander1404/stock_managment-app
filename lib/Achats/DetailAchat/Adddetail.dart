import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Adddetail extends StatefulWidget {
  String idvente='';
  Adddetail(this.idvente, {super.key});

  @override
  State<Adddetail> createState() => _AdddetailState();
}

class _AdddetailState extends State<Adddetail> {
  
  TextEditingController codevente = TextEditingController();
  TextEditingController codeproduit = TextEditingController();
  TextEditingController quantite = TextEditingController();  
  TextEditingController prixu = TextEditingController();
  List<Achatdetail> clients = [];
  Map<String, dynamic> once={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: codeproduit,
              decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            // border: OutlineInputBorder(
                              
                            // ),
                              hintText: "Mail du client",
                              labelText: "mail"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: quantite,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: prixu,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clients.add(Achatdetail(
                    codeproduit: int.parse(codeproduit.text),
                    quantite: int.parse(quantite.text),
                    prixu: double.parse(prixu.text) ,
                    codevente: 1
                  ));
                });
                // Efface les champs après l'ajout
                codeproduit.clear();
                quantite.clear();
                prixu.clear();
              },
              child: Text('Ajouter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Affiche les données au format JSON
                // print(clients.map((client) => client.toJson()).toList());
                // print(clients);
                List j=clients.map((e) => e.toJson()).toList();
                print(j);
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}

class Achatdetail {
  int codevente;
  int codeproduit;
  int quantite;
  double prixu;

  Achatdetail({required this.codeproduit, required this.quantite,required this.codevente, required this.prixu});

  Map<String, dynamic> toJson() {
    return {
      'vente_id': codevente,
      'produit_id': codeproduit,
      'quantite': quantite,
      'prixu': prixu,
    };
  }
}