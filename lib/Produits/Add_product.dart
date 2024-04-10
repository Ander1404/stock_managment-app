import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:stocktrue/Paternars.dart';
class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => AddproductState();
}

class AddproductState extends State<Addproduct> {

 File? _image;
String selectedvalue='';
  Future<void> savadatas() async {
    // if (nom.text.isEmpty ||
    //     detail.text.isEmpty ||
    //     source.text.isEmpty ||
    //     dateN.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Vous avez un champ vide'),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );
    //   return;
    // }
    try {
      var url = "http://$adress/API_VENTE/PRODUIT/getproduit.php";
      Uri ulr = Uri.parse(url);
      var request = http.MultipartRequest('POST', ulr);
      request.fields['titre'] = nom.text;
      request.fields['cat'] = desc.text;
      request.files.add(http.MultipartFile.fromBytes(
          'image1', File(_image!.path).readAsBytesSync(),
          filename: _image!.path));
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        print("Success insert");
      } else {
        print("Error insert");
      }
    } catch (e) {
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
  TextEditingController nom=TextEditingController();
  TextEditingController desc=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sreenh = MediaQuery.of(context).size.height;
    // User? user = FirebaseAuth.instance.currentUser;
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
      body: ListView.builder(
          itemCount: 1, // Number of items in the list
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      const TextField(
                          controller: null,
                          decoration: InputDecoration(
                              hintText: "Nom du produits", labelText: "Nom")),
                      const SizedBox(height: 25),
                      const TextField(
                          controller: null,
                          decoration: InputDecoration(
                              hintText: "Description du produits",
                              labelText: "Description")),
                      const SizedBox(
                        height: 25,
                      ),
                     ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary:
                        //     CouleurPrincipale, // Définir la couleur du bouton
                        // Autres propriétés de style du bouton peuvent être définies ici
                      ),
                      child: Text(
                        "la photo1",
                        // style: TitreStyleWhite,
                      ),
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.orange[800],
                          fixedSize: const Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            
                          ),
                        ),
                      ),
                      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: SizedBox(
                        height: sreenh * 0.2,
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
                                      width: 1.0, // Épaisseur de la bordure
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text('Aucune image sélectionnée'),
                                  ),
                                )
                              : Image.file(_image!),
                        ),
                      ),
                    ),
                  ])
                    ],
                  ),
                ),
              ],
            );
          }),
    );  
  
  
  }
}
