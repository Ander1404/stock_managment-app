import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocktrue/Clients/home/Addclient.dart';
import 'package:stocktrue/ip.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  String adress = currentip();

  double screenheigth = 0;

  double screenwith = 0;

  List data = [];
  String status = '';
  Future<void> delrecord(var id) async {
    try {
      String tmp=id.toString();
      var url = "http://$adress/API_VENTE/CATEGORIEPROD/deletecategorie.php";
      var result = await http.post(Uri.parse(url),
       body: {
        "id": tmp
        }
        );
      var reponse = jsonDecode(result.body);
      if (reponse["Success"] == "succes") {
        print("record deleted");
        debugPrint("");
        getrecord();
      } else {
        print("Erreur de suppression");
        getrecord();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    var url = "http://$adress/API_VENTE/CATEGORIEPROD/getcategorie.php";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        data = jsonDecode(response.body);
        print(data);
        status = 'Success';
      });
        
      // } else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrecord();
  }

  TextEditingController designation = TextEditingController();
  TextEditingController detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    screenwith = MediaQuery.of(context).size.width;
    screenheigth = MediaQuery.of(context).size.height;   
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: ListView.builder(
          // itemCount: data.length,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddClient()));
             
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Editacta(data[index]["CODETYPE"],data[index]["MOTIF"],data[index]["MONTANT"])));
                  },
                  leading: const Icon(
                    Icons.category,
                  ),
                  title: Text(
                    "Categorie: ${data[index]["desigantion"]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //  subtitle: Text("Montant: ",
                  //  style:  TextStyle(
                  //   color: princip(),
                  //  ),),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          delrecord(data[index]["id_categorie"]);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        //  color: Colors.redAccent,
                      )),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getrecord();
          // Assuming you have imported the flutter_dialogues package

          showDialog(
            context: context,
            builder: (BuildContext context) {
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
                        "Ajouter une categorie",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                          controller: designation,
                          
                          decoration: const InputDecoration(

                              prefixIcon: Icon(Icons.description),
                              
                              border: OutlineInputBorder(
                                
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              hintText: "Designation Categorie",
                              labelText: "Designation")
                              ),
                      const SizedBox(height: 10),
                      TextField(
                          controller: detail,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.devices_fold_rounded),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              hintText: "Detail categorie",
                              labelText: "Detail")),
                      const SizedBox(height: 25),
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
                          // savadatas();
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
                ),
              
              );
            },
          );
        },
        // backgroundColor: Colors.white,
        child: const Icon(
          Icons.add_outlined,
          //size: 3,

          // color: princip(),
        ),
      ),
    );
  }
}
