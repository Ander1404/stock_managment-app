import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:stocktrue/Paternars.dart';
import 'package:stocktrue/ip.dart';

import '../main.dart';
class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => AddproductState();
}

class AddproductState extends State<Addproduct> {

 File? _image;
var selectedvalue;
var selectedname;
String adress=currentip();
List d=[];
  Future<void> savadatas() async {
    try {
      var url = "http://$adress/API_VENTE/PRODUIT/insertproduit.php";
      Uri ulr = Uri.parse(url);
      var request = http.MultipartRequest('POST', ulr);
      request.fields['designation'] = nom.text;
      request.fields['categorie_id'] = "1";
      request.files.add(http.MultipartFile.fromBytes(
          'image1', File(_image!.path).readAsBytesSync(),
          filename: _image!.path));
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        bar("Success insert");
      } else {
        bar("Error insert");
      }
    } catch (e) {
      bar(e.toString());
      print(e);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Erreur lors de la sélection de l\'image : $e');
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
  Future<void> getrecord() async {
    var url = "http://$adress/API_VENTE/CATEGORIEPROD/getcategorie.php";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        d = jsonDecode(response.body);
        print(d);
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
    getrecord();
    super.initState();
  }
  TextEditingController nom=TextEditingController();
  TextEditingController desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sreenh = MediaQuery.of(context).size.height;
    final sreenw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text(
        'New Product',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,          
        ),
        )),
      body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                       TextField(
                          controller: nom,
                          decoration:const InputDecoration(
                            prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                              hintText: "Nom du produits", labelText: "Nom")),
                      const SizedBox(height: 25),
                      DropdownButtonFormField(
            items:d.map((list){
                return DropdownMenuItem(   
                  value: list["id_categorie"],
                  child: Text(list["desigantion"]),
                  );
          }
          ).toList(),
          //onChanged: onChanged,
          
          value: selectedvalue,          
          icon: const Icon(Icons.arrow_drop_down_circle),
          decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.category_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Categorie",
                  labelText: "Categorie"),
          onChanged: (value){
            selectedvalue=value;
            // client=selectedvalue;
            setState(() {
              selectedname=value.toString();
            });
            
            print(selectedname);
          },
              ),
                      const SizedBox(
                        height: 25,
                      ),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary:
                        //     CouleurPrincipale, // Définir la couleur du bouton
                        // Autres propriétés de style du bouton peuvent être définies ici
                      ),
                      child: const Text(
                        "Chosir la photo",
                        // style: TitreStyleWhite,
                      ),
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                      const SizedBox(
                        height: 2,
                      ),                      
                      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,                  
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: SizedBox(
                        height: sreenh * 0.35,
                        width: sreenw * 0.45,
                        child: Center(
                          child: _image == null
                              ? Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          Colors.black26, // Couleur de la bordure
                                      width: 3.0, // Épaisseur de la bordure
                                    ),
                                  ),
                                  child: const Center(                                    
                                    child: Center(
                                      child: Text('Aucune image sélectionnée'),
                                    ),
                                  ),
                                )
                              : Image.file(_image!),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                        onPressed: () {
                          // nom.clear();
                          if(nom.text.isEmpty){
                            bar("Completer tous les champs");
                          }
                          else{
                              savadatas();
                          // setState(() {
                          //   nom.clear();
                          //   _image=null;
                          // });
                          
                            Navigator.pushAndRemoveUntil(
            context, 
            CupertinoPageRoute(builder: (context)=>const Homescreen()), (Route<dynamic>route)=>false,);
                          }
                          
                          
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromARGB(255, 229, 184, 147),
                          fixedSize: const Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                            
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            )
          
          ],
             
          ),
    
    );  
  
  
  }
}
